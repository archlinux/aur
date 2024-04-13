#!/bin/sh

# Useful link to keep track of latest API changes:
#
# https://developer.android.com/ndk/downloads/revision_history

_android_arch=$1

source android-env "${_android_arch}"

if [ -z "${_android_arch}" ]; then
    _android_arch=armv7a-eabi
fi

if [ -z "${RUST_CHANNEL}" ]; then
    export RUST_CHANNEL=nightly
fi

case "${_android_arch}" in
    aarch64)
        export CARGO_BUILD_TARGET=aarch64-linux-android
        ;;
    armv7a-eabi)
        export CARGO_BUILD_TARGET=armv7-linux-androideabi
        ;;
    x86)
        export CARGO_BUILD_TARGET=i686-linux-android
        ;;
    x86-64)
        export CARGO_BUILD_TARGET=x86_64-linux-android
        ;;
    *)
        export CARGO_BUILD_TARGET=${_android_arch}-linux-android
        ;;
esac

export CARGO_HOME="${HOME}/.android-cargo/${_android_arch}/${ANDROID_NDK_PLATFORM}"

android_rust_prepare() {
    rustup target add "${CARGO_BUILD_TARGET}"
    rustup default "${RUST_CHANNEL}" && rustup update

    mkdir -p "${CARGO_HOME}"
    cat << EOF > "${CARGO_HOME}/config.toml"
[target.${CARGO_BUILD_TARGET}]
ar = "${ANDROID_AR}"
linker = "${ANDROID_CC}"
EOF
}

android_cargo_cbuild() {
    cargo cbuild \
        --target "${CARGO_BUILD_TARGET}" \
        --prefix="${ANDROID_PREFIX}" \
        --release \
        --frozen \
        $@
}

android_cargo_cinstall() {
    cargo cinstall \
        --target "$CARGO_BUILD_TARGET" \
        --prefix="${ANDROID_PREFIX}" \
        --release \
        --frozen \
        $@
}
