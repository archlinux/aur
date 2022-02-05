#!/bin/bash

# 修复 webview manager
# 此bug导致一下功能异常: 
# 1. 代码依赖分析不可用
# 2. 拓展中的“SERVICE MARKET RECOMMENDS”功能不可用

package_dir="$NW_PACKAGE_DIR"
sed -i 's#module.exports = createWebviewManager;#module.exports = createWebviewManager,( /** @type {any} */ (window)).createWebviewManager = createWebviewManager;#g' "$package_dir/js/libs/vseditor/webview-resource/main.js"