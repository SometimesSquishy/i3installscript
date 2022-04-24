# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes




alias icat="kitty +kitten icat"
alias c="clear && neofetch"
alias :q=exit
alias tml="tmux list-sessions"
alias tma="tmux attach -t"
alias tmd="tmux detach"
alias tmw="tmux attach -t work"
alias tmm="tmux rename-session -t"
alias tmks="tmux kill-session"
alias tmka="tmux kill-server"
alias clock="tty-clock -tcC 7"
alias vlock="vlock --all"
alias vi=nvim
alias v=nvim
alias fuckoff="doas poweroff"
alias poweroff="doas poweroff"
alias shutdown="doas poweroff"
alias reboot="doas reboot"
alias spd="speedtest-cli"
alias n="neofetch"
alias wtr="clear && neofetch && curl -s https://wttr.in"
alias weather="clear && neofetch && curl -s https://wttr.in"


#alias history="history 1| awk '{print $2}' | sort | uniq -c | sort -rn | head -n10"
#alias ip="curl http://ident.me; echo"

export EDITOR=nvim

alias sc="watcher -ds"
alias sudo visudo="sudo EDITOR=nvim visudo"
alias cmus="rm /home/squishy/.config/cmus/cache ;cmus"

alias music-dlp="exec ~/Tools/bin/yt-dlp.sh"
neofetch

# Luke's config for the Zoomer Shell

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
