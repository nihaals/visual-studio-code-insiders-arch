#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Support setting global flags
if [[ -f "${XDG_CONFIG_HOME}/code-flags.conf" ]]; then
   CODE_USER_FLAGS="$(cat "${XDG_CONFIG_HOME}/code-flags.conf")"
fi

exec /opt/visual-studio-code-insiders/bin/code-insiders $CODE_USER_FLAGS "$@"

