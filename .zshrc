export LANG=en_US.UTF-8

# Base PATH setup
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Oh My Zsh installation path
export ZSH="$HOME/.oh-my-zsh"

# Theme
eval "$(starship init zsh)"

# Homebrew setup
if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Znap setup
[[ -f ~/Git/zsh-snap/znap.zsh ]] || git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap
source ~/Git/zsh-snap/znap.zsh

# Znap plugins
# znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-completions
znap source Aloxaf/fzf-tab
znap source chrissicool/zsh-256color
znap source MichaelAquilina/zsh-you-should-use

# Oh My Zsh plugins
plugins=(copyfile colored-man-pages docker copybuffer dirhistory git sudo vi-mode command-not-found)
source $ZSH/oh-my-zsh.sh

# Aliases
alias vc="cd ~/.config/nvim && nvim ."
alias src="source ~/.zshrc"
alias zshrc="nvim ~/.zshrc"
alias .="nvim ."
alias fzfclip='tac | fzf --multi | tr "\n" " " | xclip -selection clipboard'
alias ff='nvim $(find . -type f \( -path "*/node_modules/*" -prune \) -o -type f -print | fzf -m --preview="bat --color=always {}")'
alias fd='cd "$(find . -type d \( -name node_modules -prune \) -o -type d -print | fzf --preview="ls -al {}")" && nvim .'
alias cat='batcat'

# Alias to start MongoDB
alias mongostart="sudo systemctl start mongod"

# Alias to stop MongoDB
alias mongostop="sudo systemctl stop mongod"

# next.js check all 
alias checkall="pnpm check-types && pnpm lint --fix && pnpm format"

# Command substitutions
if command -v eza &>/dev/null; then
  alias ls='eza --icons=always --color=auto --long'
fi

# autocompletions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

if command -v aws_completer &>/dev/null; then
  complete -C '$(which aws_completer)' aws
fi


# Go environment setup
export GOROOT=/home/harish/.local/share/mise/installs/go/1.23.2
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Node Version Manager (NVM) setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bun setup
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/home/harish/.bun/_bun" ] && source "/home/harish/.bun/_bun"

# SST setup
export PATH=$PATH:$HOME/.sst/bin

# Fzf-tab styling
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':fzf-tab:complete:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Bindings 
bindkey '^ ' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Additional tools
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh)"
