#!/bin/bash
sudo mv /usr/lib/liteloader-qqnt-*/LiteLoaderQQNT-* /opt/QQ/resources/app/LiteLoader
sed -i 's/"main": ".\/app_launcher\/index.js"/"main": "LiteLoader"/g' /opt/QQ/resources/app/LiteLoader/package/json
echo "install done."
