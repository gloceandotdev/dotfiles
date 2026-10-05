fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path /Users/glocean/.cargo/bin
fish_add_path ~/.config/emacs/bin
fish_add_path /opt/homebrew/opt/openjdk@21/bin

alias neofetch='fastfetch -c neofetch'
alias pppwn='cd ~/PPPwn && sudo python3 pppwn.py --interface=en8 --fw=1100'
alias e='emacsclient -c -n'
alias burp='brew update && brew upgrade --greedy'

if status is-interactive
    if test "$TERM_PROGRAM" != "vscode" -a "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" -a -z "$INSIDE_EMACS"
        neofetch
    end
end

set -U fish_greeting

starship init fish | source

# Created by `pipx` on 2026-03-23 17:09:55
set PATH $PATH /Users/glocean/.local/bin

fish_config theme choose Meadow
