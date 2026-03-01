#!/bin/bash
APP_NAME="ecliypse"
AUR_DIR="./_aur"

for tool in bun rustc cargo updpkgsums makepkg; do
    if ! command -v $tool > /dev/null; then
        echo "Error: $tool is not installed."
        exit 1
    fi
done

if [ ! -f "package.json" ]; then
    echo "Error: Please run this script from the project root."
    exit 1
fi

cleanup() {
    echo "Cleaning up..."
    rm -f "$APP_NAME" icon.png "$APP_NAME-$VERSION.tar.gz"
}
trap cleanup EXIT

VERSION=$(grep '"version":' package.json | cut -d'"' -f4)
RUST_LOG=1 NO_STRIP=1 bun run tauri build --verbose --bundles deb,rpm

cp -f src-tauri/icons/128x128.png icon.png
cp -f src-tauri/target/release/$APP_NAME .
tar -czvf "$APP_NAME-$VERSION.tar.gz" $APP_NAME icon.png

if [ -d "$AUR_DIR" ]; then
    cp "$APP_NAME-$VERSION.tar.gz" "$AUR_DIR/"

    PROJECT_ROOT=$(pwd)
    cd "$AUR_DIR"

    sed -i "s/^pkgver=.*/pkgver=$VERSION/" PKGBUILD
    sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

    echo "Tarball ready: $APP_NAME-$VERSION.tar.gz"
    echo "Upload it to https://s3.lillianne.solutions/aur/ then press Enter to continue..."
    read -r

    updpkgsums
    makepkg --printsrcinfo > .SRCINFO

    # Run local test install
    # makepkg -si --noconfirm

    cd "$PROJECT_ROOT"
else
    echo "Warning: AUR_DIR not found."
fi
