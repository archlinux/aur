# Maintainer: aquova <mail at aquova dot net>

pkgname=rvz-mime
pkgdesc="Provides MIME type for the Dolphin emulator's RVZ format"
pkgver=1
pkgrel=1
arch=("any")
license=("CC0")
depends=()
source=(
    "x-gamecube-rvz.xml"
)
sha256sums=(
    "f319110c2222d821a856a74bf494678a2fbe02b18a638a19796f6bdf93f41ade"
)

package() {
    mkdir -p $pkgdir/usr/share
    install -Dm644 $srcdir/x-gamecube-rvz.xml $pkgdir/usr/share/mime/packages/x-gamecube-rvz.xml
}
