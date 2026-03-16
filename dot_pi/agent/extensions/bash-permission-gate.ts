/**
 * Bash Permission Gate Extension
 *
 * Adds an optional permission gate for all bash commands that can be easily toggled.
 * When enabled, prompts for confirmation before executing any bash command.
 *
 * Usage:
 * - /bash-gate toggle  - Toggle the permission gate on/off
 * - /bash-gate status  - Show current status
 * - /bash-gate enable  - Enable the permission gate
 * - /bash-gate disable - Disable the permission gate
 *
 * The gate state persists across session reloads.
 */

import type { ExtensionAPI, ExtensionContext } from "@mariozechner/pi-coding-agent";
import { isToolCallEventType } from "@mariozechner/pi-coding-agent";

// State persisted to session
interface GateState {
	enabled: boolean;
}

export default function bashPermissionGateExtension(pi: ExtensionAPI) {
	// Track whether the gate is enabled
	let isEnabled = false;

	/**
	 * Persist current state to session
	 */
	function persistState() {
		pi.appendEntry<GateState>("bash-permission-gate", {
			enabled: isEnabled,
		});
	}

	/**
	 * Restore state from session entries
	 */
	function restoreFromBranch(ctx: ExtensionContext) {
		// Get entries in current branch only
		const branchEntries = ctx.sessionManager.getBranch();

		for (const entry of branchEntries) {
			if (entry.type === "custom" && entry.customType === "bash-permission-gate") {
				const data = entry.data as GateState | undefined;
				if (data?.enabled !== undefined) {
					isEnabled = data.enabled;
				}
			}
		}
	}

	/**
	 * Show current status notification
	 */
	function showStatus(ctx: ExtensionContext) {
		const status = isEnabled ? "ENABLED" : "DISABLED";
		const icon = isEnabled ? "🔒" : "🔓";
		ctx.ui.notify(`${icon} Bash permission gate is ${status}`, isEnabled ? "success" : "info");
	}

	// Register /bash-gate command with subcommands
	pi.registerCommand("bash-gate", {
		description: "Toggle bash permission gate on/off",
		getArgumentCompletions: (prefix) => {
			const subcommands = ["toggle", "status", "enable", "disable"];
			const filtered = subcommands.filter((s) => s.startsWith(prefix));
			return filtered.length > 0 ? filtered.map((s) => ({ value: s, label: s })) : null;
		},
		handler: async (args, ctx) => {
			const subcommand = args.trim().toLowerCase();

			switch (subcommand) {
				case "":
				case "toggle": {
					isEnabled = !isEnabled;
					persistState();
					showStatus(ctx);
					break;
				}
				case "enable": {
					isEnabled = true;
					persistState();
					showStatus(ctx);
					break;
				}
				case "disable": {
					isEnabled = false;
					persistState();
					showStatus(ctx);
					break;
				}
				case "status": {
					showStatus(ctx);
					break;
				}
				default: {
					ctx.ui.notify(`Unknown subcommand: ${subcommand}. Use toggle, status, enable, or disable.`, "error");
				}
			}
		},
	});

	// Listen for bash tool calls and block if gate is enabled
	pi.on("tool_call", async (event, ctx) => {
		if (!isEnabled) return undefined;
		if (!isToolCallEventType("bash", event)) return undefined;

		const command = event.input.command as string;

		// Skip if no UI is available (non-interactive mode)
		if (!ctx.hasUI) {
			return {
				block: true,
				reason: "Bash permission gate enabled but no UI available for confirmation",
			};
		}

		// Prompt for confirmation
		const choice = await ctx.ui.select(
			`🔒 Bash command requires confirmation:\n\n  ${command}\n\nExecute this command?`,
			["Yes", "No"]
		);

		if (choice !== "Yes") {
			return { block: true, reason: "Blocked by bash permission gate" };
		}

		return undefined;
	});

	// Restore state on session events
	pi.on("session_start", async (_event, ctx) => {
		restoreFromBranch(ctx);
	});

	pi.on("session_fork", async (_event, ctx) => {
		restoreFromBranch(ctx);
	});

	pi.on("session_tree", async (_event, ctx) => {
		restoreFromBranch(ctx);
	});
}
