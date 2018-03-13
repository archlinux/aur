# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=pstack
pkgver=1.3
pkgrel=1
pkgdesc='Print stack trace of running processes'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='http://code.lm7.fr/p/pstack'
license=('GPL2')
source=("https://code.lm7.fr/robotux/pstack/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('90cbe2aefd12f5bbb123a2dbc0cccc966ed64c5a511c1b86a5d00c182430ec72')

build() {
    cd "$pkgname"
    export BINDIR="${pkgdir}/usr/bin"
    export MANDIR="${pkgdir}/usr/share/man"
    make
}

package() {
    cd "$pkgname"
    export BINDIR="${pkgdir}/usr/bin"
    export MANDIR="${pkgdir}/usr/share/man"
    make install
}
