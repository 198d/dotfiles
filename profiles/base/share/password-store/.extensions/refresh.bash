#!/usr/bin/env bash
set -eo pipefail

PASS_PATH=$1
$PASSWORD_STORE_DIR/.refresh/$PASS_PATH | pass insert -m -f $PASS_PATH >/dev/null
