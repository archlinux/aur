#!/bin/bash
[[ $EUID -ne 0 ]] && { echo "root permissions required"; exit 1; }
echo "this should not evaluate"
