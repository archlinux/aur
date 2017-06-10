#! /usr/bin/env sh

pushd /opt/liquidsky
wine start LiquidSkyClient.exe "--force-player" "--disable-gpu"
popd
