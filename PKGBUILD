# Maintainer: aaditya <aaditya_gnulinux[at]zoho[dot]com>

pkgname=xfsudo
pkgver=0.7.1
pkgrel=2
pkgdesc="To run graphical applications as superuser using sudo"
url="https://github.com/abchk1234/xfsudo"
arch=('any')
license=('GPL')
depends=('sudo' 'zenity')
optdepends=()
source=("https://github.com/abchk1234/xfsudo/archive/${pkgver}.tar.gz")
sha1sums=('0f4ed6df1826cda279acd62a6146244b2795224e')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" MANDIR=/usr/share/man DOCDIR=/usr/share/doc install
}

# vim:set ts=2 sw=2 et:
