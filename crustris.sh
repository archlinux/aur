#!/bin/bash
# A wrapper script which launches crustris through crustygame.
#
# License: GPL3
#
# Copyright (C) 2021 Kevin Morris <kevr@0cost.org>
# All Rights Reserved.
cd /usr/share/crustris
exec crustygame "$@" -- ./crustris.cvm
