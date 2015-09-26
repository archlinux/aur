# Maintainer: Aoibhinn di Tori <email@aoibh.in>

_pkgname=fygar
pkgname=${_pkgname}-git
pkgver=20150916
pkgrel=1
pkgdesc="Wrapper for pacman and packer."
arch=('any')
url="https://github.com/aoibhinnditori/fygar"
license=('GPL3')
depends=('packer')
source=(git+https://github.com/aoibhinnditori/${_pkgname}.git)
md5sums=('SKIP')

package() {
    cd $srcdir/$_pkgname/src
    install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=4 sw=4 et:
