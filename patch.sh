#!/usr/bin/env sh

if [ "${1}" = "-R" ]; then
  sed -i -e 's/^[[:blank:]]*"serviceUrl":.*/\t\t"serviceUrl": "https:\/\/open-vsx.org\/vscode\/gallery",/' \
    -e '/^[[:blank:]]*"cacheUrl/d' \
    -e 's/^[[:blank:]]*"itemUrl":.*/\t\t"itemUrl": "https:\/\/open-vsx.org\/vscode\/item"/' \
    -e '/^[[:blank:]]*"documentationUrl/i\\t"linkProtectionTrustedDomains": ["https://open-vsx.org"],' \
    -e 's/^[[:blank:]]*"nameLong":.*/\t"nameLong": "Code - OSS",/' \
    -e 's/^[[:blank:]]*"extensionAllowedProposedApi":.*/\t"extensionAllowedProposedApi": ["ms-vscode.vscode-js-profile-flame", "ms-vscode.vscode-js-profile-table", "ms-vscode.github-browser", "ms-vscode.github-richnav"],/' \
    /usr/lib/code/product.json
else
  sed -i -e 's/^[[:blank:]]*"serviceUrl":.*/\t\t"serviceUrl": "https:\/\/marketplace.visualstudio.com\/_apis\/public\/gallery",/' \
    -e '/^[[:blank:]]*"serviceUrl/a\\t\t"cacheUrl": "https:\/\/vscode.blob.core.windows.net\/gallery\/index",' \
    -e 's/^[[:blank:]]*"itemUrl":.*/\t\t"itemUrl": "https:\/\/marketplace.visualstudio.com\/items"/' \
    -e '/^[[:blank:]]*"linkProtectionTrustedDomains/d' \
    -e 's/^[[:blank:]]*"nameLong":.*/\t"nameLong": "Visual Studio Code",/' \
    -e 's/^[[:blank:]]*"extensionAllowedProposedApi":.*/\t"extensionAllowedProposedApi": ["GitHub.codespaces", "GitHub.vscode-pull-request-github-insiders", "GitHub.vscode-pull-request-github", "Microsoft.vscode-nmake-tools", "ms-ai-tools.notebook-renderers", "ms-dotnettools.dotnet-interactive-vscode", "ms-python.gather", "ms-python.python", "ms-toolsai.jupyter", "ms-toolsai.vscode-ai", "ms-toolsai.vscode-ai-remote", "ms-vscode-remote.remote-containers-nightly", "ms-vscode-remote.remote-containers", "ms-vscode-remote.remote-ssh-edit-nightly", "ms-vscode-remote.remote-ssh-edit", "ms-vscode-remote.remote-ssh-nightly", "ms-vscode-remote.remote-ssh", "ms-vscode-remote.remote-wsl-nightly", "ms-vscode-remote.remote-wsl", "ms-vscode-remote.remote-wsl-recommender", "ms-vscode-remote.vscode-remote-extensionpack-nightly", "ms-vscode-remote.vscode-remote-extensionpack", "ms-vscode.azure-account", "ms-vscode.azure-sphere-tools-ui", "ms-vscode.azure-sphere-tools", "ms-vscode.github-browser", "ms-vscode.github-richnav", "ms-vscode.js-debug-nightly", "ms-vscode.js-debug", "ms-vscode.lsif-browser", "ms-vscode.vscode-js-profile-flame", "ms-vscode.vscode-js-profile-table", "ms-vscode.vscode-selfhost-test-provider", "ms-vsliveshare.cloudenv-explorer", "ms-vsliveshare.cloudenv", "ms-vsliveshare.vsliveshare", "ms-vsonline.vsonline", "dbaeumer.vscode-eslint"],/' \
    /usr/lib/code/product.json
fi
