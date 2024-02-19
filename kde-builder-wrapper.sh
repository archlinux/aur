#!/bin/bash

export VIRTUAL_ENV=/usr/share/kde-builder/.venv
export PIPENV_VERBOSITY=-1
pipenv run python /usr/share/kde-builder/kde-builder $@
