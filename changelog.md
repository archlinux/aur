## 0.0.328 - 2025-09/26

- Improved error message received when Copilot CLI is blocked by organization policy (fixes https://github.com/github/copilot-cli/issues/18 )
- Improved the error message received when using a PAT that is missing the "Copilot Requests" permission (fixes https://github.com/github/copilot-cli/issues/46 )
- Improved the output of `/user list` to make it clearer which is the current user
- Improved PowerShell parsing of `ForEach-Object` and detection of command name expressions (e.g.,`& $someCommand`)
