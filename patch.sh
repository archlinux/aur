#!/usr/bin/env sh

if [ "${1}" = "-R" ]; then
  sed -i -e 's/^[[:blank:]]*"serviceUrl":.*/\t\t"serviceUrl": "https:\/\/open-vsx.org\/vscode\/gallery",/' \
    -e '/^[[:blank:]]*"cacheUrl/d' \
    -e 's/^[[:blank:]]*"itemUrl":.*/\t\t"itemUrl": "https:\/\/open-vsx.org\/vscode\/item"/' \
    -e '/^[[:blank:]]*"linkProtectionTrustedDomains/d' \
    -e '/^[[:blank:]]*"documentationUrl/i\\t"linkProtectionTrustedDomains": ["https://open-vsx.org"],' \
    /usr/lib/code/product.json
else
  sed -i -e 's/^[[:blank:]]*"serviceUrl":.*/\t\t"serviceUrl": "https:\/\/marketplace.visualstudio.com\/_apis\/public\/gallery",/' \
    -e '/^[[:blank:]]*"cacheUrl/d' \
    -e '/^[[:blank:]]*"serviceUrl/a\\t\t"cacheUrl": "https:\/\/vscode.blob.core.windows.net\/gallery\/index",' \
    -e 's/^[[:blank:]]*"itemUrl":.*/\t\t"itemUrl": "https:\/\/marketplace.visualstudio.com\/items"/' \
    -e '/^[[:blank:]]*"linkProtectionTrustedDomains/d' \
    /usr/lib/code/product.json
fi
