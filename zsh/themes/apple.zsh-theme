function toon {
  echo -n "⨍ "
}

get_git_dirty() { 
  git diff --quiet || echo '*'
}

autoload -Uz vcs_info
autoload -U colors && colors
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%B%F{red}*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%B%F{yellow}+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats \
    '%B%F{5}%F{5}[%F{2}%F{3}|%F{1}%a%c%u%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%B%F{5}%F{5}[%F{2}%b%c%u%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%B%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

precmd () {
    vcs_info
}

setopt prompt_subst
PROMPT='%{$fg_bold[green]%}[%*] %{$fg_bold[blue]%}%n%{$reset_color%}@%{$fg_bold[yellow]%}%m%{$reset_color%} %{$fg_bold[cyan]%}%~/%{$reset_color%} %{$reset_color%}${vcs_info_msg_0_}%{$reset_color%}
%{$fg_bold[magenta]%}$(toon)%{$reset_color%}' 
