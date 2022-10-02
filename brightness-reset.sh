#!/bin/bash

site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

cd ${site_packages}/brightness_controller_linux
python brightness-reset
