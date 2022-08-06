#!/usr/bin/env sh

product_json_path="/usr/lib/code/product.json"

_patch() {
  # Patch "extensionsGallery"

  # Remove original "extensionsGallery" key.
  sed -i -z -e 's/\t"extensionsGallery.*item"\n\t},\n//' \
    "${1}"

  # Add new "extensionsGallery" key
  # Use vim to open product.json in official release and visual select the lines of "extensionsGallery"
  # Execute :'<,'>join
  # Select joined line and execute :'<,'>s/\//\\\//g
  sed -i -e '/^\t"quality/a\\t"extensionsGallery": { "nlsBaseUrl": "https:\/\/www.vscode-unpkg.net\/_lp\/", "serviceUrl": "https:\/\/marketplace.visualstudio.com\/_apis\/public\/gallery", "cacheUrl": "https:\/\/vscode.blob.core.windows.net\/gallery\/index", "itemUrl": "https:\/\/marketplace.visualstudio.com\/items", "publisherUrl": "https:\/\/marketplace.visualstudio.com\/publishers", "resourceUrlTemplate": "https:\/\/{publisher}.vscode-unpkg.net\/{publisher}\/{name}\/{version}\/{path}", "controlUrl": "https:\/\/az764295.vo.msecnd.net\/extensions\/marketplace.json", "recommendationsUrl": "https:\/\/az764295.vo.msecnd.net\/extensions\/workspaceRecommendations.json.gz" },' \
    "${1}"



  # Patch "linkProtectionTrustedDomains"

  # Use vim to open product.json in official release and visual select the line of "linkProtectionTrustedDomains"
  # Execute :'<,'>s/\//\\\//g
  sed -i -e 's/^\t"linkProtectionTrustedDomains.*/\t"linkProtectionTrustedDomains": ["https:\/\/*.visualstudio.com", "https:\/\/*.microsoft.com", "https:\/\/aka.ms", "https:\/\/*.gallerycdn.vsassets.io", "https:\/\/github.com\/microsoft\/", "https:\/\/github.com\/MicrosoftDocs\/", "https:\/\/login.microsoftonline.com"],/' \
    "${1}"
}

_restore() {
  sed -i -e 's/^\t"extensionsGallery.*/\t"extensionsGallery": {\n\t\t"serviceUrl": "https:\/\/open-vsx.org\/vscode\/gallery",\n\t\t"itemUrl": "https:\/\/open-vsx.org\/vscode\/item"\n\t},/' \
    -e 's/^\t"linkProtectionTrustedDomains.*/\t"linkProtectionTrustedDomains": ["https:\/\/open-vsx.org"],/' \
    "${1}"
}

# Use grep -q to detect if product.json has already been patched.
if grep -q "open-vsx" "${product_json_path}" & [ "$1" = '' ]; then
  _patch "${product_json_path}"
elif ! grep -q "open-vsx" "${product_json_path}" & [ "$1" = '-R' ]; then
  _restore "${product_json_path}"
fi
