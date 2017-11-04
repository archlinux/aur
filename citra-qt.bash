#!/bin/bash

env LD_PRELOAD=/usr/lib/libcurl.so.3 /opt/citra/citra-qt "$@"