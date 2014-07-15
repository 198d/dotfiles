export PATH=/usr/local/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PS1="\[\e[0;36m\]\u@\h \[\e[1;30m\]|\[\e[0m\] \@\n\[\e[1;30m\][\[\e[0m\]\w\[\e[1;30m\]]\[\e[0m\] $ "
export ARCHFLAGS="-arch x86_64"

export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

export EDITOR=/usr/bin/vim

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    source $rc
  done
fi
