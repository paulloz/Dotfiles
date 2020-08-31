# Path to oh-my-zsh
export ZSH="/home/paulloz/.oh-my-zsh"

# Theme
ZSH_THEME="paulloz"

# Plugins
plugins=(archlinux colored-man-pages encode64 git man nmap pj sprunge sudo tmux vscode zsh-autosuggestions)

# Completion
COMPLETION_WAITING_DOTS="true"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Navigation
PROJECT_PATHS=(~/Documents)

# Aliases
alias cat="bat"
alias mkdir="mkdir -p"
alias grep="grep -n --color"

# Editors
EDITOR=code
if command -v nvim &>/dev/null;
then
	alias vim="nvim"
fi
