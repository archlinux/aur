#!/usr/bin/env sh

if [ "${1}" = "-R" ]; then
  sed -i -e 's/^[[:blank:]]*"serviceUrl":.*/\t\t"serviceUrl": "https:\/\/open-vsx.org\/vscode\/gallery",/' \
    -e '/^[[:blank:]]*"cacheUrl/d' \
    -e 's/^[[:blank:]]*"itemUrl":.*/\t\t"itemUrl": "https:\/\/open-vsx.org\/vscode\/item"/' \
    -e '/^[[:blank:]]*"resourceUrlTemplate/d' \
    -e '/^[[:blank:]]*"controlUrl/d' \
    -e '/^[[:blank:]]*"linkProtectionTrustedDomains/d' \
    -e '/^[[:blank:]]*"documentationUrl/i\\t"linkProtectionTrustedDomains": ["https:\/\/open-vsx.org"],' \
    /usr/lib/code/product.json
else
  sed -i -e 's/^[[:blank:]]*"serviceUrl":.*/\t\t"serviceUrl": "https:\/\/marketplace.visualstudio.com\/_apis\/public\/gallery",/' \
    -e '/^[[:blank:]]*"cacheUrl/d' \
    -e '/^[[:blank:]]*"serviceUrl/a\\t\t"cacheUrl": "https:\/\/vscode.blob.core.windows.net\/gallery\/index",' \
    -e 's/^[[:blank:]]*"itemUrl":.*/\t\t"itemUrl": "https:\/\/marketplace.visualstudio.com\/items",/' \
    -e '/^[[:blank:]]*"itemUrl/a\\t\t"resourceUrlTemplate": "https:\/\/{publisher}.vscode-unpkg.net\/{publisher}\/{name}\/{version}\/{path}",\n\t\t"controlUrl": "https:\/\/az764295.vo.msecnd.net\/extensions\/marketplace.json"' \
    -e '/^[[:blank:]]*"linkProtectionTrustedDomains/d' \
    -e '/^[[:blank:]]*"documentationUrl/i\\t"linkProtectionTrustedDomains": ["https:\/\/*.visualstudio.com", "https:\/\/*.microsoft.com", "https:\/\/aka.ms", "https:\/\/vscode-auth.github.com", "https:\/\/client-auth-staging-14a768b.herokuapp.com", "https:\/\/*.gallerycdn.vsassets.io", "https:\/\/github.com\/microsoft\/", "https:\/\/github.com\/MicrosoftDocs\/", "https:\/\/login.microsoftonline.com"],' \
    /usr/lib/code/product.json
fi
