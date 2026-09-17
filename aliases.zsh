# Editor
alias nv='nvim'
alias snv='sudo -e'

# Better ls
alias ls='eza --color=always --group-directories-first --icons=always'

# Detailed listing
alias ll='eza -lh --color=always --group-directories-first --icons=always --git'

# Detailed listing including hidden files
alias la='eza -lah --color=always --group-directories-first --icons=always --git'

# Tree view
alias tree='eza --tree --icons=always'

# Dotfiles only
alias l.="eza -a | grep -e '^\.'"

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Faster mirrors
alias rate-mirrors='rate-mirrors --disable-comments-in-file --entry-country=ZA --protocol=https arch --max-delay 7200 | sudo tee /etc/pacman.d/mirrorlist'

# =========================================================
# Core utilities
# =========================================================

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory

lf() { # zsh follow lf navigation
    tmp=$(mktemp)
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir=$(cat "$tmp")
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

