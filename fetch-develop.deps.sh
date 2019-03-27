#!/bin/sh

set -ex

YARN_INSTALL_ARGS=("$@")

echo "get matrix-js-sdk"
git clone https://github.com/matrix-org/matrix-js-sdk.git
pushd matrix-js-sdk
git checkout develop
yarn install --cache-folder="${YARN_INSTALL_ARGS[@]}"
yarn add source-map-loader --cache-folder="${YARN_INSTALL_ARGS[@]}" # because webpack is made of fail (https://github.com/webpack/webpack/issues/1472)
popd

echo "get matrix-react-sdk"
git clone https://github.com/matrix-org/matrix-react-sdk.git
pushd matrix-react-sdk
git checkout develop
yarn install --cache-folder="${YARN_INSTALL_ARGS[@]}"
popd