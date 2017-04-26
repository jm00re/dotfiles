# Set up the prompt
setopt histignorealldups sharehistory

# Use vim keybindings even if our EDITOR is set to vi
 bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Not totally sure what this does. But it's been here forever so I like it.
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

# Mark tmux beautiful
alias tmux="env TERM=screen-256color tmux"

# Use stronger encryption with hdiutil
alias hdc="hdiutil create -size 1g -encryption AES-256 -type SPARSE -fs HFS+" 
alias hda="hdiutil attach"
alias hdd="hdiutil detach"
alias hdr="diskutil rename"

alias nvim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias emacs="emacs --no-splash"
alias ag="ag --ignore=~/.ignore --color"
alias node="node --harmony"
alias nocolor="perl -pe 's/\e\[?.*?[\@-~]//g'"

alias v='vim'
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias strip_after_colon="awk -F':' '{print \$1}'"
alias strip_color_codes="perl -pe 's/\e\[?.*?[\@-~]//g'"
alias get_ag_file="strip_after_colon | strip_color_codes | uniq"

# Filter input lines by given length
filter_length() {
	awk -v var="$1" "length(\$0) < var"
}

alias todo="vim ~/.todo.md"
alias notes="vim ~/.notes.md"
alias scratch="vim ~/.scratch.txt"
alias ls="ls -G"
alias less="less -R"

autoload -U colors && colors

# My prompt
PS1="$fg[blue]%}[%*]%{$fg[cyan]%}[%n@%{$fg[cyan]%}%m]%{$fg[green]%}[%~]
%{$fg[blue]%}›%{$fg[cyan]%}›%{$fg[green]%}›%{$reset_color%} "

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

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# Show the correct editor mode on the right hand side of the prompt
function zle-line-init zle-keymap-select {
	VIM_PROMPT="%{$fg[blue]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# These are custom vim mode key bindings
bindkey -M vicmd 'H' vi-beginning-of-line
bindkey -M vicmd 'L' vi-end-of-line

# Remember this might break
source /usr/local/Cellar/zsh-syntax-highlighting/0.2.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias fzf="TERM=screen-256color fzf"

# fzf -> open file in vim
function vf() {
	if [ "$#" -eq 0 ]
	then
		# This little chunk here is magic
		files=( "${(@f)$(fzf -m)}" )
		if [ -z $files ]
		then
		else
			print $files
			vim -- $files
		fi
	elif [ "$#" -eq 1 ]
	then
		file=$(fzf --filter=$1 | head -1)
		if [ -z $file ]
		then
		else
			print $file
			vim -- $file
		fi
	fi
}

# This might break if brew updates it
source /usr/local/Cellar/zplug/2.4.1/init.zsh

zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Check for new plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
