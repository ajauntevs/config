# Lines configured by zsh-newuser-install
HISTFILE=~/.zshist
HISTSIZE=3000
SAVEHIST=3000
unsetopt beep
setopt ignoreeof 
setopt share_history
setopt extended_history
setopt hist_ignore_dups
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

EDITOR=nvim

export PATH="$PATH:/opt/buildroot-5/bin:/opt/bin"

function zle-line-init zle-keymap-select {
    MODE="${${KEYMAP/vicmd/"%{$fg[red]%}#"}/(main|viins)/"%{$fg[green]%}#"}"
    PROMPT="[%{$fg[blue]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}] $MODE%{$reset_color%} "
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

#if [ "$TMUX" = "" ]; then 
#    tmux; 
#fi

