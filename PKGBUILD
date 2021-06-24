# Maintainer Gabriel de Oliveira <gabriel.o03@aluno.ifsc.edu.br>

pkgname=hummin
pkgver=_
pkgrel=1
pkgdesc="Command line client for the imperial library of trantor"
url="http://kx5thpx2olielkihfyo4jgjqfb7zx7wxr3sd4xzt26ochei4m6f7tayd.onion/"
license=('WTFPL')
source=("git+https://gitlab.com/trantor/hummin.git")
sha512sums=('SKIP')
arch=('x86_64')
depends=(tor)
makedepends=(go)

build() {
    cd $pkgname
    go build
}

package() {
    cd $pkgname
    mkdir -p $pkgdir/usr/bin/
    install -m 0755 hummin $pkgdir/usr/bin
}

#vim: syntax=sh
