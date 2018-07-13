#!/bin/bash

clear
pwd
cd /opt/QxEntityEditor/app
export LD_LIBRARY_PATH=$PWD:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$PWD/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$PWD/unixODBC/lib:$LD_LIBRARY_PATH
./QxEntityEditor

