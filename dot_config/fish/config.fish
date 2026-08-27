if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""

    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    if command -v zoxide >/dev/null 2>&1
        zoxide init fish | source
    end

    if command -v starship >/dev/null 2>&1
        starship init fish | source
    end

    if command -v eza >/dev/null 2>&1
        alias e="eza -lah"
    end

    if command -v bat >/dev/null 2>&1
        alias b="bat"
    end

    if command -v lazygit >/dev/null 2>&1
        alias lg="lazygit"
    end
end

if command -v mise >/dev/null 2>&1
  mise activate fish | source
end

if command -v nvim >/dev/null 2>&1
    alias n="nvim"
    set -gx EDITOR "nvim"
end
