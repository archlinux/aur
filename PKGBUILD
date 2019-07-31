# Maintainer: GrapheneX Team <graphenex.project@protonmail.com>

pkgname=graphenex
pkgver=1.1.1
pkgrel=1
pkgdesc="Automated System Hardening Framework"
url="https://github.com/grapheneX/grapheneX"
depends=('python')
makedepends=('python3')
license=('GPLv3')
arch=('any')
source=('https://files.pythonhosted.org/packages/06/6f/9115c73ef7340b32812995523c7754b1dea063ef373f1ea9446cdc5ee5f1/graphenex-1.1.1.tar.gz')
md5sums=('4578f3bffaa49edd8ca2be4830b20e77')

build() {
    cd $srcdir/graphenex-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/graphenex-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
