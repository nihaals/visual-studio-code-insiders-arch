#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f "${XDG_CONFIG_HOME}/code-flags.conf" ]]; then
   CODE_USER_FLAGS="$(cat "${XDG_CONFIG_HOME}/code-flags.conf")"
fi

# Launch
exec /opt/visual-studio-code-insiders/bin/code-insiders $CODE_USER_FLAGS "$@"

