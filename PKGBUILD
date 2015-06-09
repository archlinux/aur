# Maintainer: aaditya <aaditya_gnulinux[at]zoho[dot]com>

pkgname=xfsudo
pkgver=0.7.1
pkgrel=1
pkgdesc="To run graphical applications as superuser using sudo."
url="http://github.com/aadityabagga/xfsudo"
arch=('any')
license=('GPL')
depends=('sudo' 'zenity')
optdepends=()
source=("http://github.com/aadityabagga/xfsudo/archive/${pkgver}.tar.gz")
sha1sums=('0f4ed6df1826cda279acd62a6146244b2795224e')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man DOCDIR=/usr/share/doc install
}

# vim:set ts=2 sw=2 et:
