#!/bin/sh
NODE_PATH=/usr/share/google-chat-linux/node_modules/.bin
export PATH=$NODE_PATH:$PATH

cd /usr/share/google-chat-linux \
  && ${NODE_PATH}/electron .

