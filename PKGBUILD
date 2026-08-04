# Maintainer: Andres Rodriguez <andresx7@gmail.com>

# The dock updater code is proprietary, which means that in this
# PKGBUILD we only have access to prebuilt binaries.

pkgname=jupiter-dock-updater-bin
_srctag=jupiter-20260602.01
_srcver=${_srctag#jupiter-}
pkgver=${_srcver//-/.}
pkgrel=1
pkgdesc="Firmware updater for the Steam Deck Dock"
url="https://github.com/evlav/jupiter-dock-updater-bin"
arch=(x86_64)
license=(proprietary)
depends=()
makedepends=(git openssh)
source=("git+https://github.com/evlav/jupiter-dock-updater-bin.git#tag=$_srctag")
sha256sums=('e977a6bb339437e58ad5b05b8a7853f9f8f36f8c721ef9e0f32f40e6fc700d65')

prepare() {
    cd "$pkgname"
    # Nothing to do
}

build() {
    cd "$pkgname"
    # Nothing to do
}

package() {
    cd "$pkgname"
    cp -a "packaged/." "$pkgdir"
}
