#!/usr/bin/bash

export _portableConfig="com.bytedance.feishu"

# Double dash is important!
exec portable -- $@
