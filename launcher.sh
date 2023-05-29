#!/usr/bin/env bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
exec /opt/kitchenowl/kitchenowl "$@"
