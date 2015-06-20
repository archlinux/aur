#!/bin/sh
exec "/opt/dearesther/bin/wine" --bottle "dearesther" --check --wait-children --start "C:/users/Public/Start Menu/Programs/Dear Esther/Dear Esther.lnk" "$@"
