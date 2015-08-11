if [ -e "/usr/lib/libreoffice/program/uno.py" ]; then
 export PYTHONPATH="$PYTHONPATH:/usr/lib/libreoffice/program/"
 export URE_BOOTSTRAP="file:///usr/lib/libreoffice/program/fundamentalrc"
fi
