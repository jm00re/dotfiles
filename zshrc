# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt bart

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#alias tmux="TERM=screen-256color-bce tmux"

export TERM="xterm-256color"
alias tmux="TERM=screen-256color-bce tmux"

alias todo="vim ~/.todo.txt"
alias scratch="vim ~/.scratch.txt"

alias ls="ls -G"

alias less="less -R"
if [ "$TMUX" = "" ]; then tmux; fi

autoload -U colors && colors
PS1="%{$fg[red]%}[%n@%{$fg[red]%}%m]%{$fg[blue]%}[%~] %{$fg[red]%}%% %{$reset_color%}"

function least() 
{
	cat "$@" | lolcat -f | less -R
}
	
function pythong() 
{
	python "$@" | lolcat -f 
}

#PROMPT="%t %{$fg[cyan]%}%?%{$resetcolor%} %{$fg[blue]%}%~%{$resetcolor%} %# "
#RPROMPT="%{$fg[green]%}%t%{$reset_color%}"

#alias tmux="tmux -2"


typeset -Ag FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %F{$code}Test%f"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    ((cc = code + 1))
    print -P -- "$BG[$code]$code: Test %{$reset_color%}"
  done
}
#eval $(dircolors -b ~/.dir_colors)

#PROMPT="%F{74}Test%f"
#
export EDITOR="vim"

# Less Colors for Man Pages 
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking 
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold 
export LESS_TERMCAP_me=$'\E[0m'           # end mode 
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode 
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box 
export LESS_TERMCAP_ue=$'\E[0m'           # end underline 
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

#man() {
#      env \
#		  LESS_TERMCAP_mb=$(printf "\e[1;31m") \
#		  LESS_TERMCAP_md=$(printf "\e[1;31m") \
#		  LESS_TERMCAP_me=$(printf "\e[0m") \
#		  LESS_TERMCAP_se=$(printf "\e[0m") \
#		  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
#		  LESS_TERMCAP_ue=$(printf "\e[0m") \
#		  LESS_TERMCAP_us=$(printf "\e[1;32m") \
#	  			   man "$@"
#}
#
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg[red]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

source ~/.opp.zsh/opp.zsh
