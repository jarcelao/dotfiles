if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end

fish_add_path $HOME/.local/bin/

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

zoxide init fish | source
starship init fish | source
