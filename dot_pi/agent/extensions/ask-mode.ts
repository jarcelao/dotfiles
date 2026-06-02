/**
 * Ask-Mode Extension
 *
 * Toggles a read-only mode that disables write/edit/bash tools.
 * The LLM can only read, search, and answer questions.
 *
 * Usage:
 *   /ask-mode          — toggle on/off
 *   ctrl+shift+a       — toggle on/off (keyboard shortcut)
 *   pi --ask-mode      — start in ask-mode
 */

import type {
	ExtensionAPI,
	ExtensionContext,
} from "@earendil-works/pi-coding-agent";

const WRITE_TOOLS = ["write", "edit", "bash"];

interface AskModeState {
	enabled: boolean;
	savedTools: string[] | null;
}

export default function askModeExtension(pi: ExtensionAPI) {
	let enabled = false;
	let savedTools: string[] | null = null;

	function applyState(ctx?: ExtensionContext) {
		if (enabled) {
			const allTools = pi.getAllTools().map((t) => t.name);
			const filtered = allTools.filter((t) => !WRITE_TOOLS.includes(t));
			pi.setActiveTools(filtered);
			if (ctx) ctx.ui.setStatus("ask-mode", "❓ ask-mode");
		} else {
			if (savedTools) {
				pi.setActiveTools(savedTools);
			} else {
				// Fallback: restore all tools
				pi.setActiveTools(pi.getAllTools().map((t) => t.name));
			}
			if (ctx) ctx.ui.setStatus("ask-mode", undefined);
		}
	}

	function persistState() {
		pi.appendEntry<AskModeState>("ask-mode-state", {
			enabled,
			savedTools,
		});
	}

	function toggle(ctx: ExtensionContext) {
		if (enabled) {
			enabled = false;
		} else {
			savedTools = pi.getActiveTools();
			enabled = true;
		}
		applyState(ctx);
		persistState();
		ctx.ui.notify(
			enabled ? "Ask-mode enabled (read-only)" : "Ask-mode disabled (read-write)",
			"info",
		);
	}

	function restoreFromBranch(ctx: ExtensionContext) {
		const branchEntries = ctx.sessionManager.getBranch();
		let lastState: AskModeState | undefined;

		for (const entry of branchEntries) {
			if (entry.type === "custom" && entry.customType === "ask-mode-state") {
				const data = entry.data as AskModeState | undefined;
				if (data) lastState = data;
			}
		}

		if (lastState) {
			enabled = lastState.enabled;
			savedTools = lastState.savedTools;
		}
		applyState(ctx);
	}

	pi.registerFlag("ask-mode", {
		description: "Start in read-only ask-mode",
		type: "boolean",
		default: false,
	});

	pi.registerCommand("ask-mode", {
		description: "Toggle read-only ask-mode (disable write/edit/bash)",
		handler: async (_args, ctx) => {
			toggle(ctx);
		},
	});

	pi.registerShortcut("ctrl+shift+a", {
		description: "Toggle ask-mode",
		handler: async (ctx) => {
			toggle(ctx);
		},
	});

	pi.on("session_start", async (event, ctx) => {
		const flagOn = pi.getFlag("ask-mode");

		if (flagOn) {
			if (!enabled) {
				savedTools = pi.getActiveTools();
			}
			enabled = true;
		} else if (event.reason === "startup") {
			// Only restore from branch on initial startup, not on every session_start
			// (fork/resume/new will re-emit session_start, but we handle those via session_tree)
			restoreFromBranch(ctx);
			return;
		}

		applyState(ctx);
	});

	pi.on("session_tree", async (_event, ctx) => {
		restoreFromBranch(ctx);
	});

	pi.on("before_agent_start", async (event, ctx) => {
		if (!enabled) return;

		const readOnlyInstructions = [
			"",
			"## READ-ONLY ASK-MODE",
			"You are operating in read-only ask-mode. The write, edit, and bash tools are DISABLED.",
			"Do NOT attempt to create, modify, or delete files. Do NOT suggest running commands.",
			"Use your available read-only tools (read, grep, find, ls) to explore and answer questions.",
			"If the user asks you to make changes, explain that you are in ask-mode and suggest they toggle it off with /ask-mode.",
			"",
		].join("\n");

		return {
			systemPrompt: event.systemPrompt + readOnlyInstructions,
		};
	});
}
