#!/bin/sh
cd /opt/anki-sync-server
sudo -u anki-sync-server git submodule update --init anki-bundled
cd anki-bundled
sudo pacman -S --asdeps python-beautifulsoup4 python-send2trash \
python-pyaudio python-requests python-decorator \
python-psutil python-distro python-markdown \
python-pyqt5 python-pyqtwebengine
sudo -u anki-sync-server sh tools/build_ui.sh #for aqt dependency
