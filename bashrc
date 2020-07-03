export EDITOR=$(which nvim)


function .path.insert {
  if [[ $PATH != *"$1"* ]]; then
    export PATH=$1:$PATH
  fi
}


if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    source $rc
  done
fi


function .bashrc.reload {
  source $HOME/.bashrc
}
