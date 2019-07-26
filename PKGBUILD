# Maintainer: GrapheneX Team <graphenex.project@protonmail.com>

pkgname=graphenex
pkgver=1.1.0
pkgrel=1
pkgdesc="Automated System Hardening Framework"
url="https://github.com/grapheneX/grapheneX"
depends=('python')
makedepends=('python3')
license=('GPLv3')
arch=('any')
source=('https://files.pythonhosted.org/packages/81/a2/23b43366c26e613458b67e6872d613ff36eaa51f51c26ea760036de6524c/graphenex-1.1.0.tar.gz')
md5sums=('8b46e125c4886ec332065cfa00c8feed')

build() {
    cd $srcdir/graphenex-1.1.0
    python setup.py build
}

package() {
    cd $srcdir/graphenex-1.1.0
    python setup.py install --root="$pkgdir" --optimize=1 
}
