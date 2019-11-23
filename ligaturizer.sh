#!/bin/sh

fontforge -lang py -script /usr/share/ligaturizer/ligaturize.py --output-dir . "$@"
