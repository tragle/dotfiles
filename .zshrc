test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# path
export PATH=./node_modules/.bin:$PATH
export PATH=~/Library/Python/3.6/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"

# prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%f '
PROMPT='%~ '\$vcs_info_msg_0_'%F{green}%%%f '

# ls color
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
alias ls='ls -G'

# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
