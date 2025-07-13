# Maintainer: Minecodes <minecodes at minecodes.de>
pkgname=lopriv
pkgver=v1.0.0
pkgrel=4
groups=('mcds')
pkgdesc="A simple bash command to allow tools that use priviledged ports to run as non-root users."
arch=('any')
url="https://codeberg.org/Minecodes/Quicksetup"
license=('bsd-4-clause')
optdepends=('sudo')
source=("lopriv::https://codeberg.org/Minecodes/aur-lopriv/raw/branch/master/lopriv")
sha256sums=('dda4261b743288bd512d5aef31951a4a8434db89c8a94c19fcb63f718839d7e1')
package() {
    install -Dm755 "$srcdir/lopriv" "$pkgdir/usr/bin/lopriv"
}
