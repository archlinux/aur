#!/bin/bash
exec /usr/bin/rg "${@/--cursor-ignore/--ignore-file}"
