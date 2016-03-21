# Lines configured by zsh-newuser-install
HISTFILE=~/.zshist
HISTSIZE=3000
SAVEHIST=3000
unsetopt beep
setopt ignoreeof
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aleksis/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors
colors

alias ls='ls --color'
alias ip='ip -c'

PROMPT="[%{$fg[blue]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}]# "
EDITOR=nvim

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-solarized.light.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
