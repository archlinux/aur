#!/usr/bin/env sh

if [ "${1}" = "-R" ]; then
  sed -i 's/^[[:blank:]]*"serviceUrl":.*/\t\t"serviceUrl": "https:\/\/open-vsx.org\/vscode\/gallery",/' /usr/lib/code/product.json
  sed -i '/^[[:blank:]]*"cacheUrl/d' /usr/lib/code/product.json
  sed -i 's/^[[:blank:]]*"itemUrl":.*/\t\t"itemUrl": "https:\/\/open-vsx.org\/vscode\/item"/' /usr/lib/code/product.json
  sed -i '/^[[:blank:]]*"documentationUrl/i\\t"linkProtectionTrustedDomains": ["https://open-vsx.org"],' /usr/lib/code/product.json
  sed -i 's/^[[:blank:]]*"nameLong":.*/\t"nameLong": "Code - OSS",/' /usr/lib/code/product.json
  sed -i 's/^[[:blank:]]*"extensionAllowedProposedApi":.*/\t"extensionAllowedProposedApi": ["ms-vscode.vscode-js-profile-flame", "ms-vscode.vscode-js-profile-table", "ms-vscode.github-browser", "ms-vscode.github-richnav"],/' /usr/lib/code/product.json
else
  sed -i 's/^[[:blank:]]*"serviceUrl":.*/\t\t"serviceUrl": "https:\/\/marketplace.visualstudio.com\/_apis\/public\/gallery",/' /usr/lib/code/product.json
  sed -i '/^[[:blank:]]*"serviceUrl/a\\t\t"cacheUrl": "https:\/\/vscode.blob.core.windows.net\/gallery\/index",' /usr/lib/code/product.json
  sed -i 's/^[[:blank:]]*"itemUrl":.*/\t\t"itemUrl": "https:\/\/marketplace.visualstudio.com\/items"/' /usr/lib/code/product.json
  sed -i '/^[[:blank:]]*"linkProtectionTrustedDomains/d' /usr/lib/code/product.json
  sed -i 's/^[[:blank:]]*"nameLong":.*/\t"nameLong": "Visual Studio Code",/' /usr/lib/code/product.json
  sed -i 's/^[[:blank:]]*"extensionAllowedProposedApi":.*/\t"extensionAllowedProposedApi": ["GitHub.codespaces", "GitHub.vscode-pull-request-github-insiders", "GitHub.vscode-pull-request-github", "Microsoft.vscode-nmake-tools", "ms-ai-tools.notebook-renderers", "ms-dotnettools.dotnet-interactive-vscode", "ms-python.gather", "ms-python.python", "ms-toolsai.jupyter", "ms-toolsai.vscode-ai", "ms-toolsai.vscode-ai-remote", "ms-vscode-remote.remote-containers-nightly", "ms-vscode-remote.remote-containers", "ms-vscode-remote.remote-ssh-edit-nightly", "ms-vscode-remote.remote-ssh-edit", "ms-vscode-remote.remote-ssh-nightly", "ms-vscode-remote.remote-ssh", "ms-vscode-remote.remote-wsl-nightly", "ms-vscode-remote.remote-wsl", "ms-vscode-remote.remote-wsl-recommender", "ms-vscode-remote.vscode-remote-extensionpack-nightly", "ms-vscode-remote.vscode-remote-extensionpack", "ms-vscode.azure-account", "ms-vscode.azure-sphere-tools-ui", "ms-vscode.azure-sphere-tools", "ms-vscode.github-browser", "ms-vscode.github-richnav", "ms-vscode.js-debug-nightly", "ms-vscode.js-debug", "ms-vscode.lsif-browser", "ms-vscode.vscode-js-profile-flame", "ms-vscode.vscode-js-profile-table", "ms-vscode.vscode-selfhost-test-provider", "ms-vsliveshare.cloudenv-explorer", "ms-vsliveshare.cloudenv", "ms-vsliveshare.vsliveshare", "ms-vsonline.vsonline", "dbaeumer.vscode-eslint"],/' /usr/lib/code/product.json
fi
