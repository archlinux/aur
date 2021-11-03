#!/bin/bash

site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

/usr/bin/python "${site_packages}"/pupgui2/pupgui2.py --pupgui2-base-dir /usr/share/pupgui2 "$@"
