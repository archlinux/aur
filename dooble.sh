#!/bin/sh
set -e
APPDIR=/opt/dooble
export AA_ENABLEHIGHDPISCALING=1
export AA_USEHIGHDPIPIXMAPS=1
export DOOBLE_ADDRESS_WIDGET_HEIGHT_OFFSET=0
export DOOBLE_GOOGLE_TRANSLATE_URL="https://%1.translate.goog/\
%2?_x_tr_sl=auto&_x_tr_tl=%3&_x_tr_hl=%3&_x_tr_pto=wapp"
export DOOBLE_TAB_HEIGHT_OFFSET=5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_X11_NO_MITSHM=1
export QTWEBENGINE_LOCALES_PATH="${APPDIR}/qtwebengine_locales:${QTWEBENGINE_LOCALES_PATH}"
export LD_LIBRARY_PATH="${APPDIR}/Lib:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${APPDIR}/plugins:${QT_PLUGIN_PATH}"
cd "${APPDIR}"
exec ./Dooble "$@"
exit $?