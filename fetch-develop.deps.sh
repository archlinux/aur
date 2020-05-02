#!/bin/sh

set -ex

YARN_INSTALL_ARGS=("$@")

echo "get matrix-js-sdk"
git clone https://github.com/matrix-org/matrix-js-sdk.git
pushd matrix-js-sdk
git checkout v6.0.0-rc.2
yarn install --cache-folder="${YARN_INSTALL_ARGS[@]}"
yarn add source-map-loader --cache-folder="${YARN_INSTALL_ARGS[@]}"
popd

echo "get matrix-react-sdk"
git clone https://github.com/matrix-org/matrix-react-sdk.git
pushd matrix-react-sdk
git checkout v2.5.0-rc.6
yarn install --cache-folder="${YARN_INSTALL_ARGS[@]}"
popd