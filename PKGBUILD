# Maintainer: Andres Rodriguez <andresx7@gmail.com>

# The dock updater code is proprietary, which means that in this
# PKGBUILD we only have access to prebuilt binaries.

pkgname=jupiter-dock-updater-bin
_srctag=jupiter-20250220.02
_srcver=${_srctag#jupiter-}
pkgver=${_srcver//-/.}
pkgrel=1
pkgdesc="Firmware updater for the Steam Deck Dock"
url="https://gitlab.steamos.cloud/jupiter/jupiter-dock-updater-bin"
arch=(x86_64)
license=(proprietary)
depends=()
makedepends=(git openssh)
source=("git+https://gitlab.com/evlaV/jupiter-dock-updater-bin.git#tag=$_srctag")
sha256sums=('f4008f72c6a6557e74f25b75060f1064d5c95e4e8cbb4f057924845fd0df6485')

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
