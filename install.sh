#!/bin/bash
sudo cp /usr/lib/liteloader-qqnt-*/LiteLoaderQQNT-* /opt/QQ/resources/app/LiteLoader
sed -i 's/"main": ".\/app_launcher\/index.js"/"main": "LiteLoader"/g' /opt/QQ/resources/app/package.json
echo "install done."

