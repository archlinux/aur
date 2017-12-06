# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=cdebootstrap-static
pkgver=0.7.7+b1
pkgrel=1
pkgdesc="Bootstrap a Debian system"
arch=('i686' 'x86_64')
url="http://packages.debian.org/search?keywords=cdebootstrap"
license=('GPL')
depends=('wget' 'gnupg')
optdepends=('debian-archive-keyring')

source_i686=(http://httpredir.debian.org/debian/pool/main/c/cdebootstrap/${pkgname}_${pkgver}_i386.deb)
source_x86_64=(http://httpredir.debian.org/debian/pool/main/c/cdebootstrap/${pkgname}_${pkgver}_amd64.deb)
md5sums_i686=('bcb012c1e670b7219a9ba0716ead2ec7')
md5sums_x86_64=('ef33d3992997f3eed274b3be2711e2e4')

package() {
  tar xJvf ${srcdir}/data.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
