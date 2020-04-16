# Maintainer: GrapheneX Team <graphenex.project@protonmail.com>

pkgname=graphenex
pkgver=1.3.1
pkgrel=1
pkgdesc="Automated System Hardening Framework"
url="https://github.com/grapheneX/grapheneX"
depends=('python')
makedepends=('python3')
license=('GPLv3')
arch=('any')
source=('https://files.pythonhosted.org/packages/38/7f/902aa41f263e577ba5f75fe9d20a195181babec94e3f93c7fe858679b7f1/graphenex-1.3.1.tar.gz')
md5sums=('fd9d49d609083bc518d7412a1f5aa62f')

build() {
    cd $srcdir/graphenex-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/graphenex-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
