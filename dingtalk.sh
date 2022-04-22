#!/bin/bash -e
export LD_LIBRARY_PATH=/usr/lib/dingtalk:$LD_LIBRARY_PATH
export PATH=/opt/dingtalk/release:$PATH
cd /opt/dingtalk/release
./com.alibabainc.dingtalk
