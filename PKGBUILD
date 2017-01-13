# Maintainer: Aoibhinn di Tori <evie@p5ych0sis.io>

_pkgname=aosuke
pkgname=${_pkgname}-git
pkgver=20170113
pkgrel=1
pkgdesc="Wrapper for pacman and packer."
arch=('any')
url="https://github.com/p5ych0sis/aosuke"
license=('BSD')
depends=('packer')
source=(git+https://github.com/p5ych0sis/${_pkgname}.git)
md5sums=('SKIP')

package() {
    cd $srcdir/$_pkgname/
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=4 sw=4 et:
