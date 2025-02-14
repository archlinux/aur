# Maintainer: Thien An Dang Thanh <thienandangthanh at gmail dot com>

pkgname=mender-artifact
provides=('mender-artifact')
conflicts=('mender-artifact')
pkgdesc="Mender.io utility to work with Mender Artifacts."
url="https://docs.mender.io/downloads#mender-artifact"
pkgver=4.0.0
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
optdepends=()

source=("$pkgname::https://downloads.mender.io/mender-artifact/$pkgver/linux/mender-artifact")
sha256sums=('e36e1f0ab4b9bf583ee209179899adf0d62a1a531f06b7a3ca77301b650398d8')

package() {
    install -Dm 755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
