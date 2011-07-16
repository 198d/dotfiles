export PATH=/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PS1="[\w]$ "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

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

