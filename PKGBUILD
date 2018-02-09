# Maintainer: Victor Roest <victor@xirion.net>
pkgname=dice-roller
pkgver=f3c7ae1
pkgrel=1
pkgdesc="A python dice rolling application using the standard dice notation"
url="https://git.xirion.net/victor/dice-roller"
license=('GPL3')
depends=('python')
makedepends=('git' 'python')
arch=('i686' 'x86_64')
provides=('dice-roller')
source=(git+https://git.xirion.net/victor/dice-roller.git)
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}
    git rev-parse --short HEAD
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir"
}
