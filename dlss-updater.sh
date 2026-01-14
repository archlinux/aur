#!/bin/sh

site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

python ${site_packages}/dlss_updater/main.py
