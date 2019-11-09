# M theme

local ret_status="%(?:%{$fg_bold[green]%}임 :%{$fg_bold[red]%}엄 %s)"

# get git pwd
function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

PROMPT="$ret_status%{$reset_color%}%{$fg[white]%}$(get_pwd) "
RPROMPT='$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[green]%} +"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"
