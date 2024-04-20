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
        export RUST_TARGET=aarch64-linux-android
        ;;
    armv7a-eabi)
        export RUST_TARGET=armv7-linux-androideabi
        ;;
    x86)
        export RUST_TARGET=i686-linux-android
        ;;
    x86-64)
        export RUST_TARGET=x86_64-linux-android
        ;;
    *)
        export RUST_TARGET=${_android_arch}-linux-android
        ;;
esac

export CARGO_HOME="${HOME}/.android-cargo/${_android_arch}/${ANDROID_NDK_PLATFORM}"

android_rust_prepare() {
    rustup target add "${RUST_TARGET}"
    rustup default "${RUST_CHANNEL}" && rustup update

    mkdir -p "${CARGO_HOME}"
    cat << EOF > "${CARGO_HOME}/config.toml"
[target.${RUST_TARGET}]
ar = "${ANDROID_AR}"
linker = "${ANDROID_CC}"
EOF
}

android_cargo_cbuild() {
    cargo cbuild \
        --target "${RUST_TARGET}" \
        --prefix="${ANDROID_PREFIX}" \
        --release \
        --frozen \
        $@
}

android_cargo_cinstall() {
    cargo cinstall \
        --target "$RUST_TARGET" \
        --prefix="${ANDROID_PREFIX}" \
        --release \
        --frozen \
        $@
}
