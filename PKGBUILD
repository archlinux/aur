# Maintainer: Yacob Zitouni <yacob.zitouni@gmail.com>
pkgname=('projectctr-makerom-bin')
pkgver=0.17
pkgrel=1
pkgdesc="Creates CTR cxi/cfa/cci/cia files"
arch=('i686' 'x86_64')
url="https://github.com/3DSGuy/Project_CTR/"
license=('unknown')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
sha256sums=("976c17a78617e157083a8e342836d35c47a45940f9d0209ee8fd210a81ba7bc0")

source=("$pkgname-$pkgver.zip::https://github.com/3DSGuy/Project_CTR/releases/download/makerom-v0.17/makerom-v0.17-ubuntu_x86_64.zip")

package() {
    install -D "$srcdir/makerom" "$pkgdir/usr/bin/makerom"
}
