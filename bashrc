export PATH=/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PS1="\[\e[1;34m\]\u@\H\[\e[0m\] | \[\e[1;34m\]\@\[\e[0m\]\n[\w]$ "
export ARCHFLAGS="-arch x86_64"

export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

export EDITOR=/usr/local/bin/vim


function attach {
  if [ $# -ne 1 ]; then
    return 1
  fi

  tmux attach -t $1
}


function workspace {
  local s=$1
  if [ $# -ne 1 ]; then
    s=$(basename `pwd`)
  fi

  tmux has-session -t $s
  if [ $? -ne 0 ]; then
    tmux -2 new-session -d -s $s
    tmux new-window -t $s:0 -k -n Vim
    tmux send-keys -t $s:0 "vim" C-m
    tmux new-window -t $s:1 -k -n Bash
    tmux select-window -t $s:0

    sleep 1
  fi

  tmux -2 attach -t $s
}


function venv {
  if [ $# -eq 1 ]; then
    if [ "$1" == "destroy" ]; then
      deactivate
      rm -rf .env
      return 0
    fi
    cd $1
  fi

  name=$(basename `pwd`)
  location='./.env'

  if [ ! -d $location ]; then
    virtualenv --prompt='$name | ' $location
  fi

  source $location/bin/activate
}


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
