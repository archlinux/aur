#!/bin/bash
export FTB_APP_PATH="$(dirname $(realpath $0))"
exec %electron% "$FTB_APP_PATH/app.asar" "$@"
