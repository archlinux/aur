# Maintainer: Thien An Dang Thanh <thienandangthanh at gmail dot com>

pkgname=mender-artifact
provides=('mender-artifact')
conflicts=('mender-artifact')
pkgdesc="Mender.io utility to work with Mender Artifacts."
url="https://docs.mender.io/downloads#mender-artifact"
pkgver=3.11.3
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
depends=()
optdepends=()

source=("$pkgname::https://downloads.mender.io/mender-artifact/$pkgver/linux/mender-artifact")
sha256sums=('f8b2916ad5b71bbf646c6aaf8461836bd96a0d5e064e59216c4d2b46de63a509')

package() {
    install -Dm 755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
