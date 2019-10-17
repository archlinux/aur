# Maintainer: GrapheneX Team <graphenex.project@protonmail.com>

pkgname=graphenex
pkgver=1.2.2
pkgrel=1
pkgdesc="Automated System Hardening Framework"
url="https://github.com/grapheneX/grapheneX"
depends=('python')
makedepends=('python3')
license=('GPLv3')
arch=('any')
source=('https://files.pythonhosted.org/packages/c5/07/0b8fef8343021cebd2e2ddb12b1aefc6897be9eb1492c218651efa23610a/graphenex-1.2.2.tar.gz')
md5sums=('558de7f722996af5c687bb048ca36f0e')

build() {
    cd $srcdir/graphenex-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/graphenex-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
