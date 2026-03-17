# Maintainer: Thien An Dang Thanh <thienandangthanh at gmail dot com>

pkgname=mender-artifact
provides=('mender-artifact')
conflicts=('mender-artifact')
pkgdesc="Mender.io utility to work with Mender Artifacts."
url="https://docs.mender.io/downloads#mender-artifact"
pkgver=4.1.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
optdepends=()

source=("$pkgname::https://downloads.mender.io/mender-artifact/$pkgver/linux/mender-artifact")
sha256sums=('7ccc0b703c1ed8ec35c685a59ba5f7422deaf37958aff33ebaf0ee33c969442f')

package() {
    install -Dm 755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
