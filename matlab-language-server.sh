#!/bin/sh

exec node @@MATLAB_LANGUAGE_SERVER_ROOT@@/out/index.js --matlabInstallPath "@@MATLAB_ROOT@@/@@MATLAB_RELEASE@@" "$@"
