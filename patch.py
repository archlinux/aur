#!/usr/bin/env python
from sys import argv
from json import load, dump, JSONDecodeError
from requests import get

PRODUCT_JSON_LOCATION = "/opt/vscodium-bin/resources/app/product.json"


if __name__ == "__main__":
    try:
        with open(PRODUCT_JSON_LOCATION) as file:
            product = load(file)
    except JSONDecodeError:
        result = get('https://github.com/microsoft/vscode/raw/main/product.json')
        if result.ok:
            product = result.json()
        else:
            print(
                "error: couldn't parse local product.json or fetch a new one from the web")
            exit(1)
    if '-R' in argv:
        product["nameLong"] = "VSCodium"
        product.pop("auth", None)
        product.pop("configurationSync.store", None)
        product.pop("editSessions.store", None)
        product.pop("extensionEnabledApiProposals", None)
    else:
        product["nameLong"] = "Visual Studio Code"
        product["auth"] = {
            "loginUrl": "https://login.microsoftonline.com/common/oauth2/authorize",
            "tokenUrl": "https://login.microsoftonline.com/common/oauth2/token",
            "redirectUrl": "https://vscode-redirect.azurewebsites.net/",
            "clientId": "aebc6443-996d-45c2-90f0-388ff96faa56"
        }
        product["configurationSync.store"] = {
            "url": "https://vscode-sync.trafficmanager.net/",
            "stableUrl": "https://vscode-sync.trafficmanager.net/",
            "insidersUrl": "https://vscode-sync-insiders.trafficmanager.net/",
            "canSwitch": False,
            "authenticationProviders": {
                "microsoft": {
                    "scopes": ["openid", "profile", "email", "offline_access"]
                },
                "github": {
                    "scopes": ["user:email"]
                }
            }
        }
        product["editSessions.store"] = {
            "url": "https://vscode-sync.trafficmanager.net/",
            "authenticationProviders": {
                "microsoft": {
                    "scopes": ["openid", "profile", "email", "offline_access"]
                },
                "github": {
                    "scopes": ["user:email"]
                }
            }
        }
        product["extensionEnabledApiProposals"] = {
            "ms-vscode.vscode-selfhost-test-provider": ["testObserver"],
            "VisualStudioExptTeam.vscodeintellicode-completions": ["inlineCompletionsAdditions"],
            "ms-vsliveshare.vsliveshare": [
                "contribMenuBarHome", "diffCommand",
                "documentFiltersExclusive", "fileSearchProvider",
                "findTextInFiles", "notebookCellExecutionState",
                "notebookLiveShare", "terminalDimensions",
                "terminalDataWriteEvent", "textSearchProvider"
            ],
            "ms-vscode.js-debug": [
                "portsAttributes", "findTextInFiles", "workspaceTrust",
                "tunnels"
            ],
            "ms-toolsai.vscode-ai-remote": ["resolvers"],
            "ms-python.python": ["quickPickSortByLabel", "testObserver", "telemetryLogger"],
            "ms-dotnettools.dotnet-interactive-vscode": ["notebookMessaging"],
            "GitHub.codespaces": [
                "contribEditSessions", "contribMenuBarHome",
                "contribRemoteHelp", "contribViewsRemote", "resolvers",
                "tunnels", "terminalDataWriteEvent", "treeViewReveal",
                "notebookKernelSource"
            ],
            "ms-vscode.azure-repos": [
                "extensionRuntime", "fileSearchProvider", "telemetryLogger",
                "textSearchProvider"
            ],
            "ms-vscode.remote-repositories": [
                "contribEditSessions", "contribRemoteHelp",
                "contribMenuBarHome", "contribViewsRemote",
                "contribViewsWelcome", "contribShareMenu",
                "documentFiltersExclusive", "editSessionIdentityProvider",
                "extensionRuntime", "fileSearchProvider",
                "quickPickSortByLabel", "workspaceTrust", "scmActionButton",
                "scmSelectedProvider", "scmValidation", "telemetryLogger",
                "textSearchProvider", "timeline"
            ],
            "ms-vscode-remote.remote-wsl": ["resolvers", "contribViewsRemote", "telemetry"],
            "ms-vscode-remote.remote-ssh": [
                "resolvers", "tunnels", "terminalDataWriteEvent",
                "contribViewsRemote", "telemetry"
            ],
            "ms-vscode.remote-server": ["resolvers"],
            "ms-vscode.remote-explorer": ["contribViewsRemote", "extensionsAny"],
            "ms-vscode-remote.remote-containers": [
                "contribEditSessions", "resolvers", "tunnels",
                "workspaceTrust", "terminalDimensions", "contribViewsRemote"
            ],
            "ms-vscode.js-debug-nightly": [
                "portsAttributes", "findTextInFiles", "workspaceTrust",
                "tunnels"
            ],
            "ms-vscode.lsif-browser": ["documentFiltersExclusive"],
            "GitHub.vscode-pull-request-github": [
                "contribCommentThreadAdditionalMenu", "tokenInformation",
                "commentsResolvedState", "contribShareMenu",
                "contribCommentPeekContext", "treeItemCheckbox",
                "codiconDecoration", "diffCommand"
            ],
            "GitHub.copilot": ["inlineCompletionsAdditions"],
            "GitHub.copilot-nightly": ["inlineCompletionsAdditions"],
            "GitHub.remotehub": [
                "contribRemoteHelp", "contribMenuBarHome",
                "contribViewsRemote", "contribViewsWelcome",
                "documentFiltersExclusive", "extensionRuntime",
                "fileSearchProvider", "quickPickSortByLabel", "workspaceTrust",
                "scmSelectedProvider", "scmValidation", "textSearchProvider",
                "timeline", "telemetryLogger"
            ],
            "ms-python.gather": ["notebookCellExecutionState"],
            "ms-python.vscode-pylance": ["notebookCellExecutionState"],
            "ms-toolsai.jupyter-renderers": ["contribNotebookStaticPreloads"],
            "ms-toolsai.jupyter": [
                "notebookControllerKind", "notebookDeprecated",
                "notebookMessaging", "notebookMime",
                "notebookCellExecutionState", "portsAttributes",
                "quickPickSortByLabel", "notebookKernelSource",
                "interactiveWindow", "notebookControllerAffinityHidden",
                "contribNotebookStaticPreloads"
            ],
            "dbaeumer.vscode-eslint": ["notebookCellExecutionState"],
            "ms-vscode.azure-sphere-tools-ui": ["tunnels"],
            "ms-azuretools.vscode-azureappservice": ["terminalDataWriteEvent"],
            "ms-vscode.anycode": ["extensionsAny"],
            "ms-vscode.cpptools": ["terminalDataWriteEvent"],
            "redhat.java": ["documentPaste"]
        }
    with open(PRODUCT_JSON_LOCATION, mode='w') as file:
        dump(product, file, indent=4)
