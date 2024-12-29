#!/usr/bin/bash

export DOOBLE_TRANSLATIONS_PATH=/usr/share/dooble/translations
export QTWEBENGINE_DICTIONARIES_PATH=/usr/share/dooble/qtwebengine_dictionaries

exec /usr/bin/Dooble "$@"
