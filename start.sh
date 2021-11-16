#!/bin/bash

export LD_LIBRARY_PATH=/opt/yunkanpan:$LD_LIBRARY_PATH
/opt/yunkanpan/yunkanpan -start $1 
