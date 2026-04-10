#!/bin/bash

site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

exec python "${site_packages}/drill/main.py"
