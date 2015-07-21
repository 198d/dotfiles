export TERM=xterm-256color
export EDITOR=/usr/bin/vim


if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    source $rc
  done
fi
