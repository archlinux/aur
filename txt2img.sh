#!/bin/sh
python_version_major_minor=$(python -V | cut -d" " -f2 | cut -d. -f1-2) \
|| exit
export PYTHONPATH="${PYTHONPATH+:$PYTHONPATH:}"/opt/intel/openvino/python/python"$python_version_major_minor"
exec /usr/bin/python3 /opt/stable-diffusion-intel/demo.py "$@"
