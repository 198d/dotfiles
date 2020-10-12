#!/usr/bin/env bash
while [ $# -gt 0 ]; do
  local entry=$1
  shift
  if [ "$entry" = "--" ]; then
    break
  elif [ -f "$PASSWORD_STORE_DIR/env/$entry.gpg" ]; then
    environment="$environment $(pass show env/$entry)"
  else
    environment="$environment $(pass show $entry)"
  fi
done

if [ $# -gt 0 ]; then
  (eval export $environment && exec "$@")
else
  (eval export $environment; exec printenv)
fi
