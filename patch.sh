#!/usr/bin/env bash

basedir="$1"

# Fix imports secondary.py
sed -i '/from ntpath import normpath/d' "$basedir/secondary.py"
sed -i 's/from os.path import join, basename, splitext, isfile, abspath/from os.path import join, basename, splitext, isfile, abspath, normpath/' "$basedir/secondary.py"

# Fix imports main.py
sed -i '/from ntpath import normpath/d' "$basedir/main.py"
sed -i 's/from os.path import (isdir, isfile, join, basename, splitext, dirname, split, getmtime,/from os.path import isdir, isfile, join, basename, splitext, dirname, split, getmtime, abspath, splitdrive, normpath/' "$basedir/main.py"
sed -i '/                     abspath, splitdrive)/d' "$basedir/main.py"
