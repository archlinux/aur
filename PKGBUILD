# Maintainer: GrapheneX Team <graphenex.project@protonmail.com>

pkgname=graphenex
pkgver=1.2.0
pkgrel=1
pkgdesc="Automated System Hardening Framework"
url="https://github.com/grapheneX/grapheneX"
depends=('python')
makedepends=('python3')
license=('GPLv3')
arch=('any')
source=('https://files.pythonhosted.org/packages/d5/22/27812b316cceac297933f9cfb9d76e1c4481fd49138756eb8aaa6d51a21b/graphenex-1.2.0.tar.gz')
md5sums=('44bdbf8dcd024c9ecb8eb1cf5d800eef')

build() {
    cd $srcdir/graphenex-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/graphenex-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
