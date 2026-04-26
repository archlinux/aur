# Name: v3.8.0 
### URL: https://github.com/TomWright/dasel/releases/tag/v3.8.0
### published at '2026-04-25T23:28:37Z' by TomWright
---
Shell Completion Support

  Dasel now includes built-in shell completion for Bash, Zsh, Fish, and PowerShell. Tab-complete subcommands, flags, and data format names (json, yaml, toml, etc.) directly in your terminal.

  # Bash
  source <(dasel completion bash)

  # Zsh
  source <(dasel completion zsh)

  # Fish
  dasel completion fish | source

  # PowerShell
  dasel completion powershell | Out-String | Invoke-Expression

  See the shell completion docs for permanent installation instructions.

  Man Page Generation

  Generate and view a man page directly from the CLI:

  dasel man | man -l -

  Or install it system-wide:

  sudo dasel man > /usr/local/share/man/man1/dasel.1

  Bug Fixes

  - YAML string quote style (double, single, literal, folded) is now preserved on round-trip (#452).

**Full Changelog**: https://github.com/TomWright/dasel/compare/v3.7.0...v3.8.0
