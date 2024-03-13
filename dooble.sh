#!/bin/bash
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/Lib:${LD_LIBRARY_PATH}"
export AA_ENABLEHIGHDPISCALING=1
export AA_USEHIGHDPIPIXMAPS=1
export DOOBLE_ADDRESS_WIDGET_HEIGHT_OFFSET=0
export DOOBLE_GOOGLE_TRANSLATE_URL="https://%1.translate.goog/%2?_x_tr_sl=auto&_x_tr_tl=%3&_x_tr_hl=%3&_x_tr_pto=wapp"
export DOOBLE_TAB_HEIGHT_OFFSET=5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_X11_NO_MITSHM=1
export QTWEBENGINE_LOCALES_PATH="${_APPDIR}/qtwebengine_locales:${QTWEBENGINE_LOCALES_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/plugins:${QT_PLUGIN_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?