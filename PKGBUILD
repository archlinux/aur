# Maintainer: GrapheneX Team <graphenex.project@protonmail.com>

pkgname=graphenex
pkgver=1.0.0
pkgrel=1
pkgdesc="Automated System Hardening Framework"
url="https://github.com/grapheneX/grapheneX"
depends=('python')
makedepends=('python3')
license=('GPLv3')
arch=('any')
source=('https://files.pythonhosted.org/packages/9a/16/be0e710177751959f160d3f21c0d910cc9d0aa874d3550804d20ef96cedb/graphenex-1.0.0.tar.gz')
md5sums=('7ab8702e516f69369d036a87b682d2a7')

build() {
    cd $srcdir/graphenex-1.0.0
    python setup.py build
}

package() {
    cd $srcdir/graphenex-1.0.0
    python setup.py install --root="$pkgdir" --optimize=1 
}