if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""

    if command -v eza >/dev/null 2>&1
        alias e="eza -lah"
    end

    if command -v bat >/dev/null 2>&1
        alias b="bat"
    else if command -v batcat >/dev/null 2>&1
        alias b="batcat"
    end

    if command -v starship >/dev/null 2>&1
        starship init fish | source
    end
end

if test -d "$HOME/.local/bin"
    fish_add_path "$HOME/.local/bin"
end

if command -v nvim >/dev/null 2>&1
    set -gx EDITOR nvim
    alias n="nvim"
end

if test -d "$HOME/.bun"
    set --export BUN_INSTALL "$HOME/.bun"
    if test -d "$BUN_INSTALL/bin"
        set --export PATH "$BUN_INSTALL/bin" $PATH
    end
end

if command -v zoxide >/dev/null 2>&1
    zoxide init fish | source
end
