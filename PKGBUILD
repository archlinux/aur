# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=pstack
pkgver=1.3.1
pkgrel=1
pkgdesc='Print stack trace of running processes'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='http://code.lm7.fr/p/pstack'
license=('GPL2')
source=("https://code.lm7.fr/robotux/pstack/archive/8ade3d5cb9539d87cc56a72c6d9ff3a3f220f193.tar.gz")
sha256sums=('3858affaadc5948bd195fa2c55bffe632a3226f6a19434c578b6a33f8591e9d4')

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
