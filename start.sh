#!/bin/bash

export LD_LIBRARY_PATH=/usr/lib/wolai:$LD_LIBRARY_PATH
electron13 /usr/lib/wolai/resources/app.asar
