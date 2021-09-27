#!/bin/bash

export LD_PRELOAD=libSDLsteam.so
"$@"
