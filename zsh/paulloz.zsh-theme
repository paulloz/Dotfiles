function virtualenv_prompt_info() {
    if [[ -n $VIRTUAL_ENV ]]; then
        echo "─[%{$reset_color%}♻%{$fg[yellow]%}]"
    fi
}

PS1='%{$fg[yellow]%}╭─[%{$reset_color%}%n@%M%{$fg[yellow]%}]─[%{$reset_color%}%/%{$fg[yellow]%}]$(virtualenv_prompt_info)%{$reset_color%}
%{$fg[yellow]%}╰─ %{$reset_color%}'
 
PS2='%{$fg[yellow]%}╰─(%_)─ %{$reset_color%}'
  
RPS1='$(git_line)'
   
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔%{$reset_color%}"
    
git_line() {
    if [[ $(current_branch) != "" ]]; then
        GCA=$(git_commits_ahead)
        if [[ $GCA == "" ]]; then
            GCA="0"
        fi
        echo "%{$fg[yellow]%}[%{$reset_color%}$(parse_git_dirty)%{$fg[yellow]%}]-[%{$reset_color%}↑ $GCA%{$fg[yellow]%}]-[%{$reset_color%}$(current_branch)%{$fg[yellow]%}:%{$reset_color%}$(git_prompt_short_sha)%{$fg[yellow]%}]%{$reset_color%}"
    fi
}
