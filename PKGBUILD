# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=debian-archive-keyring
pkgver=2014.3
pkgrel=2
pkgdesc="GnuPG archive keys of the Debian archive"
arch=('any')
url="http://packages.debian.org/sid/debian-archive-keyring"
license=('GPL')
depends=('gnupg')

source=(http://ftp.fr.debian.org/debian/pool/main/d/debian-archive-keyring/${pkgname}_${pkgver}_all.deb)
md5sums=('02b6818bd7cada9ef9d24534290b559c')

package() {
  tar xvf ${srcdir}/data.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
