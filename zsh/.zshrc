# Environment
eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null   # non-login shells
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in *":$PNPM_HOME:"*) ;; *) export PATH="$PNPM_HOME:$PATH" ;; esac
. "$HOME/.local/bin/env"
export EDITOR="nvim"
export VISUAL="nvim"

# Completions (all fpath additions before the single compinit)
fpath=("$HOME/.docker/completions" $fpath)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/zcompcache"
setopt complete_in_word always_to_end auto_menu

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt extended_history hist_expire_dups_first hist_ignore_dups \
       hist_ignore_space hist_verify share_history

# Navigation
setopt auto_cd
alias -g ...='../..'
alias md='mkdir -p'

# Keybindings (Home/End/Delete; arrows bound after plugins load)
bindkey -e
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# Tools
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
eval "$(uv generate-shell-completion zsh)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)

# Aliases
alias ls="eza --icons"
alias l="eza -la --icons"
alias ll="eza -la --icons --git"
alias lt="eza --tree --icons -L 2"
alias vim="nvim"
alias vi="nvim"
alias g="git"
alias gst="git status"
alias gco="git checkout"

# Interactive plugins — order matters, keep last:
# fzf-tab → highlighting → substring-search → autosuggestions → atuin → zoxide
source /opt/homebrew/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

eval "$(atuin init zsh --disable-up-arrow)"   # Atuin owns Ctrl-R; ↑/↓ stay prefix-search

export _ZO_DOCTOR=0                            # silences false-positive when a tool appends a chpwd hook
eval "$(zoxide init zsh)"                       # last, so its hooks aren't overridden
