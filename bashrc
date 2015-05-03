export PS1="\[\e[0;36m\]\u@\h \[\e[1;30m\]|\[\e[0m\] \@\n\[\e[1;30m\][\[\e[0m\]\w\[\e[1;30m\]]\[\e[0m\] $ "
export TERM=xterm-256color
export EDITOR=/usr/bin/vim


if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    source $rc
  done
fi
