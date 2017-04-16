# Maintainer: Thiago Lucio <systemofdown@gmail.com>

_pkgname=numix-white-icons
_version=git
pkgname=numix-white-icons
pkgbase=numix-white-icons
pkgver=1
pkgrel=0
pkgdesc='Numix White Icons Theme based of the numix circle'
arch=('x86_64' 'i686')
url="https://github.com/killown/numix-white.git"
license=('GPL')
makedepends=('git')
install=${_pkgname}-${_version}.install
source=("git+${url}")
sha256sums=('SKIP')
package() {
	cd "$srcdir/numix-white"
        install -dm755 ${pkgdir}/usr/share/icons/
        cp -dr --no-preserve='ownership' Numix Numix-White "${pkgdir}"/usr/share/icons/
}
