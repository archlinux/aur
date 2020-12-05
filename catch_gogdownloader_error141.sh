#!/bin/bash
lgogdownloader --download-file=$1 -o $2 || test $? -eq 141
