# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=debian-archive-keyring
pkgver=2012.4
pkgrel=2
pkgdesc="GnuPG archive keys of the Debian archive"
arch=('any')
url="http://packages.debian.org/sid/debian-archive-keyring"
license=('GPL')
depends=('gnupg')

source=(http://ftp.fr.debian.org/debian/pool/main/d/debian-archive-keyring/${pkgname}_${pkgver}_all.deb)
md5sums=('f27bae2cf146acab9e750fd379dc0ed7')

package() {
  tar xzvf ${srcdir}/data.tar.gz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
