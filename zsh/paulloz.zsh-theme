PS1='%{$fg[yellow]%}╭─[%{$reset_color%}%/%{$fg[yellow]%}]%{$reset_color%}
%{$fg[yellow]%}╰─ %{$reset_color%}'
 
PS2='%{$fg[yellow]%}╰─(%_)─ %{$reset_color%}'
  
RPS1='$(git_line)'
   
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔"
    
git_line() {
    if [[ $(current_branch) != "" ]]; then
        echo "%{$fg[yellow]%}[%{$reset_color%}$(current_branch)%{$fg[yellow]%}:%{$reset_color%}$(git_prompt_short_sha)%{$fg[yellow]%}] $(parse_git_dirty) %{$reset_color%}"
    fi
}
