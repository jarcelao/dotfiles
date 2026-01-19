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

    if command -v zoxide >/dev/null 2>&1
        zoxide init fish | source
    end

    if command -v vim >/dev/null 2>&1
        alias v="vim"
        set -gx EDITOR vim
    end

    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
end

if test -d "$HOME/.local/bin"
    fish_add_path -g "$HOME/.local/bin"
end
