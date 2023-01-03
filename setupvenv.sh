#!/usr/bin/env bash
# vim:ts=4:sw=4:noet
#
# Creates a Python 3.10 virtual environment. The target directory can be passed
# as a parameter. The default path is '.venv' in the current directory.

dir="${1:-.venv}"

set -e
if [ -d "${dir}" ]; then
	echo >&2 "Directory '${dir}' already exists, exiting."
	exit 1
fi
python -m venv "${dir}"
source "${dir}/bin/activate"

set +e
pip install -U pip || true
