#!/usr/bin/env python3

# This script can update the content of ./patch.json to the latest version
# Usage: ./update.py /path/to/extracted/produce.json
# Where /path/to/extracted/produce.json is extracted from the latest version of official vscode release

import sys
import json

key_list = [
    "nameShort",
    "nameLong",
    "applicationName",
    "serverApplicationName",
    "urlProtocol",
    "dataFolderName",
    "serverDataFolderName",
    "webUrl",
    "webEndpointUrl",
    "webEndpointUrlTemplate",
    "webviewContentExternalBaseUrlTemplate",
    "commandPaletteSuggestedCommandIds",
    "extensionKeywords",
    "aiConfig",
    "settingsSearchUrl",
    "extensionEnabledApiProposals",
    "tasConfig",
    "extensionKind",
    "extensionPointExtensionKind",
    "extensionSyncedKeys",
    "extensionVirtualWorkspacesSupport",
    "trustedExtensionAuthAccess",
    "auth",
    "configurationSync.store",
    "editSessions.store",
    "tunnelApplicationName",
    "tunnelApplicationConfig"
]

product_path = sys.argv[1]
patch_path = "patch.json"

with open(product_path, "r") as product_file:
    product_data = json.load(product_file)

patch_data = {}

for key in key_list:
    patch_data[key] = product_data[key]

with open(patch_path, "w") as patch_file:
    json.dump(patch_data, patch_file, indent='\t')
