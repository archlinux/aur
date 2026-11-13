#!/bin/bash
set -o pipefail
SERVICE_NAME="aTrustDaemon.service"
_STARTED_BY_US=0
if ! systemctl is-active --quiet "${SERVICE_NAME}"; then
	echo "[INFO] Service ${SERVICE_NAME} is not running, starting it..."
	if ! systemctl start "${SERVICE_NAME}"; then
		echo "[ERROR] Failed to start service ${SERVICE_NAME}, aborting"
		exit 1
	fi
	echo "[INFO] Service ${SERVICE_NAME} started successfully"
	_STARTED_BY_US=1
	sleep 3
else
	echo "[INFO] Service ${SERVICE_NAME} is already running"
fi
_APPDIR="/usr/share/@appname@/@runpath@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}${PATH:+:$PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/uem/bin:${_APPDIR}/uem/lib:${_APPDIR}/resources/bin:${_APPDIR}/resources/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export NODE_ENV=production
cd "${_APPDIR}" || exit 1
"${_RUNNAME}" --no-sandbox --disable-gpu "$@"
PROGRAM_EXIT_CODE=$?
if (( _STARTED_BY_US )); then
	echo "[INFO] Program exited (exit code: ${PROGRAM_EXIT_CODE}), stopping service ${SERVICE_NAME}..."
	if ! systemctl stop "${SERVICE_NAME}"; then
		echo "[WARNING] Failed to stop service ${SERVICE_NAME}, please check manually"
	elif systemctl is-failed --quiet "${SERVICE_NAME}"; then
		echo "[WARNING] Service ${SERVICE_NAME} is in failed state after stop, please check manually"
	elif systemctl is-active --quiet "${SERVICE_NAME}"; then
		echo "[WARNING] Service ${SERVICE_NAME} is still active after stop, please check manually"
	else
		echo "[INFO] Service ${SERVICE_NAME} stopped successfully"
	fi
else
	echo "[INFO] Program exited (exit code: ${PROGRAM_EXIT_CODE}); service ${SERVICE_NAME} was already running, leaving it untouched"
fi
exit "${PROGRAM_EXIT_CODE}"