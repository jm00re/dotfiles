# Ignore additional whitespace when writing to hist file
setopt histignorealldups 
# Share history between terminals
setopt sharehistory
# Use vi keybindings instead of emacs(default)
 bindkey -v

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# Enable zsh tab completition
autoload -Uz compinit
compinit

# This does fancy stuff for the completition engine
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
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

# The one true editor
export EDITOR="vim"

# Mark tmux beautiful / enable maximum colors
alias tmux="env TERM=screen-256color tmux"

# CLI knox replacement
alias hdc="hdiutil create -size 1g -encryption AES-256 -type SPARSE -fs HFS+" 
alias hda="hdiutil attach"
alias hdd="hdiutil detach"
alias hdr="diskutil rename"

# pretty print things
alias pp_json="python -m json.tool"
alias pp_js="js-beautify"
alias pp_xml="xmllint --format -"

alias ag="ag -p ~/.ignore --color"
# Enable modern node.js features
alias node="node --harmony"

# I never use these
alias v='vim'
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# ag/fzf helpers
alias strip_after_colon="awk -F':' '{print \$1}'"
alias strip_color_codes="perl -pe 's/\e\[?.*?[\@-~]//g'"

# better fzf functions
alias get_ag_file="strip_after_colon | strip_color_codes | uniq"

afv() {
	if [ -t 0 ]; then
		return
	else
		fzf --ansi -m | strip_color_codes | awk -F':' '{print ":e "$1"|:"$2i"|"}' | tr -d '\n' |
		xargs -o -I {} vim -c "{} | redraw"
	fi
}

va() {
	if [ -t 0 ]; then
		return
	else
		strip_color_codes | awk -F':' '{print ":e "$1"|:"$2i"|"}' | tr -d '\n' |
		xargs -o -I {} vim -c "{} | redraw"
	fi
}

# Filter input lines by given length
filter_length() {
	awk -v var="$1" "length(\$0) < var"
}

alias ls="ls -G"
alias less="less -R"

# Enables color code shortcuts for my prompt
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

# Color testing functions
for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %F{$code}Test%f"
  done
}

function spectrum_bls() {
  for code in {000..255}; do
    ((cc = code + 1))
    print -P -- "$BG[$code]$code: Test %{$reset_color%}"
  done
}


# Less Colors for Man Pages 
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking 
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold 
export LESS_TERMCAP_me=$'\E[0m'           # end mode 
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode 
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box 
export LESS_TERMCAP_ue=$'\E[0m'           # end underline 
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

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

# This fixes an issue with truecolor support
alias fzf="TERM=screen-256color fzf"

# fzf + cd
# TODO: this doesn't actualy work how i want it to
function fd() {
	local dir
	if [ "$#" -eq 0 ]
	then
		dir=$(find -L ${1:-.} -type d 2> /dev/null | fzf ) && cd "$dir"
		print $dir
	elif [ "$#" -eq 1 ]
	then
		if [ "$1"=".." ]
		then
			get_parent_dirs() {
				if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
				if [[ "${1}" == '/' ]]; then
					for _dir in "${dirs[@]}"; do echo $_dir; done
				else
					get_parent_dirs $(dirname "$1")
				fi
			}
			local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf)
			cd "$DIR"
			print "$DIR"
		else
			dir=$(find -L ${1:-.} -type d 2> /dev/null | fzf --filter=$1 | head -1) && cd "$dir"
			print $dir
		fi
	fi
}

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

# Init fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Init zsh-syntax-highlighting, this might break with updates
source /usr/local/Cellar/zsh-syntax-highlighting/0.2.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
