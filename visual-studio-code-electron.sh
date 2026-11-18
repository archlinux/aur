#!/bin/bash
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@appname@.js"
_CLI="${_APPDIR}/out/cli.js"
export CHROME_DESKTOP="@appname@.desktop"
_SANDBOX_ARG=()
[[ "${EUID}" -eq 0 ]] && _SANDBOX_ARG=("--no-sandbox")
[[ ! -d "${_APPDIR}" ]] && { echo "Error: Application directory not found: ${_APPDIR}" >&2; exit 1; }
[[ ! -f "${_RUNNAME}" ]] && { echo "Error: Application entry point not found: ${_RUNNAME}" >&2; exit 1; }
case "${1:-}" in
	--version|-v|--help|-h|--list-extensions|--install-extension|--install-extension=*|\
	--uninstall-extension|--uninstall-extension=*|--update-extensions|\
	--locate-extension|--status|--add-mcp|--locate-shell-integration-path|chat|\
	--prof-startup|--inspect-extensions|--inspect-brk-extensions|--telemetry)
		[[ -f "${_CLI}" ]] || { echo "Error: CLI entry point not found: ${_CLI}" >&2; exit 1; }
		ELECTRON_RUN_AS_NODE=1 exec electron@electronversion@ "${_CLI}" "$@"
		;;
esac
unset ELECTRON_RUN_AS_NODE
cd "${_APPDIR}" || exit 1
exec electron@electronversion@ "${_SANDBOX_ARG[@]}" --app "${_RUNNAME}" "$@"