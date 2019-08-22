# Maintainer: GrapheneX Team <graphenex.project@protonmail.com>

pkgname=graphenex
pkgver=1.1.3
pkgrel=1
pkgdesc="Automated System Hardening Framework"
url="https://github.com/grapheneX/grapheneX"
depends=('python')
makedepends=('python3')
license=('GPLv3')
arch=('any')
source=('https://files.pythonhosted.org/packages/04/b6/409c15b2cc3f8fc26fee240d4b6ffe940327fa880116eb4013bd5185b59f/graphenex-1.1.3.tar.gz')
md5sums=('235bcacd3de7418406897540b45a6159')

build() {
    cd $srcdir/graphenex-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/graphenex-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
