#!/bin/sh

cd /opt/gpt4all-chat/bin

LD_LIBRARY_PATH=/opt/gpt4all-chat/lib /opt/gpt4all-chat/bin/gpt4all-chat $@
