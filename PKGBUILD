# Maintainer: L1bT0rch <L1bT0rch@proton.me>
# Contributor: Andres Rodriguez <andresx7@gmail.com>

# The dock updater code is proprietary, which means that in this
# PKGBUILD we only have access to prebuilt binaries.

pkgname=jupiter-dock-updater-bin
_srctag=jupiter-20260602.01
_srcver=${_srctag#jupiter-}
pkgver=${_srcver//-/.}
pkgrel=2
pkgdesc="Firmware updater for the Steam Deck Dock"
url="https://github.com/evlav/jupiter-dock-updater-bin"
arch=(x86_64)
license=(proprietary)
depends=()
makedepends=(git)
source=("git+https://github.com/evlav/jupiter-dock-updater-bin.git#tag=$_srctag")
sha256sums=('SKIP')

package() {
    cd "$pkgname"
    cp -a "packaged/." "$pkgdir"
}
