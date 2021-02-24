# Maintainer 5amu <v.casalino@protonmail.com>

pkgname=5amu-scripts
pkgver=1.0
pkgrel=1
pkgdesc="Personal POSIX scripts"
url="https://github.com/5amu/scripts/"
license=('MIT')
arch=('x86_64')
depends=('python3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/5amu/scripts/archive/${pkgver}.tar.gz")
sha256sums=("SKIP")

package() {
    cd $srcdir/scripts-$pkgver
    mkdir -p $pkgdir/usr/bin
    install -Dm755 sh/* $pkgdir/usr/bin/
}
