# Maintainer: GrapheneX Team <graphenex.project@protonmail.com>

pkgname=graphenex
pkgver=1.0.1
pkgrel=1
pkgdesc="Automated System Hardening Framework"
url="https://github.com/grapheneX/grapheneX"
depends=('python')
makedepends=('python3')
license=('GPLv3')
arch=('any')
source=('https://files.pythonhosted.org/packages/71/e4/5ca7e415275c0c46c6506078e8eb4260a4378b65b86397667dc825b188bb/graphenex-1.0.1.tar.gz')
md5sums=('d65860fe07575dcccf908f10627f7884')

build() {
    cd $srcdir/graphenex-1.0.1
    python setup.py build
}

package() {
    cd $srcdir/graphenex-1.0.1
    python setup.py install --root="$pkgdir" --optimize=1 
}
