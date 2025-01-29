# Maintainer: Fijxu <fijxu [at] nadeko [dot] net>
# Contributor: Yacob Zitouni <yacob.zitouni@gmail.com>

pkgname="projectctr-makerom"
pkgver=0.18.4
pkgrel=1
pkgdesc="Creates CTR cxi/cfa/cci/cia files"
arch=('any')
url="https://github.com/3DSGuy/Project_CTR/tree/master/makerom"
license=('MIT')
source=("https://github.com/3DSGuy/Project_CTR/archive/refs/tags/makerom-v$pkgver.tar.gz")
sha256sums=('fa34054e8f4e026bdf4a3cf523c622d942736d1a1ea60541842bd80b596e388b')

build() {
    cd "$srcdir/Project_CTR-makerom-v$pkgver/makerom"
    make deps
    make
}

package() {
    install -Dm755 $srcdir/Project_CTR-makerom-v$pkgver/makerom/bin/makerom $pkgdir/usr/bin/makerom
}
