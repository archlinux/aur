#!/bin/bash

export PYTHONPATH+=":/opt/intel/openvino/python/python$(python --version | sed -E -e 's|^[^[:space:]]*[[:space:]]([0-9]+\.[0-9]+)\..*$|\1|')"
/usr/bin/python3 /opt/stable-diffusion-intel/txt2img "$@"
