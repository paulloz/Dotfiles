
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
export HISTFILE SAVEHIST

export LS_COLORS="di=00;36:ex=01;33:ln=01;36"
export EDITOR="vim"
export PATH="/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin::/usr/bin/core_perl/:/opt/flex/bin:/usr/local/ssl/bin:/opt/eclipse:/opt/qnetsoul:/opt/java/jre/bin"
export ERL_LIBS="/usr/local/lib/yaws/"

alias ls='ls --color=always --group-directories-first'
alias l='ls'
alias ll='l -lh'
alias la='l -A'
alias lla='ll -hA'
alias clean='rm -f .*.swp'
alias j='jobs'
alias mkdir='mkdir -p'
alias grep='grep -n --color'
alias lock='slimlock'
alias halt='sudo halt'
alias reboot='sudo reboot'
alias rc.d='sudo rc.d'
alias kinit='kinit joanno_p'
alias dirs='dirs -v'
alias sakura='sakura -c 150 -r 60'
alias pacman='pacman-color'
alias irssi='screen -m irssi'
alias minecraft='java -jar /opt/minecraft/minecraft.jar'
alias gitroot='cd `git rev-parse --show-toplevel`'

PS1=$'%{\e[0;33m%}%{\e[0;32m%}Paulloz @%m %{\e[1;33m%}%1(j.#%j.)
%{\e[0;33m%}└─→ %{\e[0m%}'
PS2=$'%{\e[0;33m%}└─(%_)─→ %{\e[0m%}'

RPS1=$'%{\e[33m%}(%!) [%{\e[0;37m%}%~%{\e[0;33m%}]%{\e[0m%}'

bindkey "^[[3~"    delete-char
bindkey	"^[3;5~"   delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[OH' beginning-of-line
bindkey '^[[7~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[F' end-of-line
bindkey '^[OF' end-of-line
bindkey '^[[8~' end-of-line
bindkey "^F" history-incremental-search-forward
bindkey "^R" history-incremental-search-backward
bindkey "^A" history-beginning-search-backward

unsetopt CORRECTALL

setopt	AUTO_MENU
setopt	HIST_IGNORE_DUPS
setopt	HIST_EXPIRE_DUPS_FIRST
setopt	HIST_REDUCE_BLANKS
setopt	AUTO_PUSHD

autoload compinit
compinit

currentdir=$(pwd)
cd "/home/paulloz/.shutils/"
for file in * ; do
  source "$file"
done
cd "$currentdir"

