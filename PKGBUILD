# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=cdebootstrap-static
pkgver=0.7.8+b3
pkgrel=1
pkgdesc="Bootstrap a Debian system"
arch=('i686' 'x86_64')
url="http://packages.debian.org/search?keywords=cdebootstrap"
license=('GPL')
depends=('wget' 'gnupg')
optdepends=('debian-archive-keyring')

source_i686=(http://httpredir.debian.org/debian/pool/main/c/cdebootstrap/${pkgname}_${pkgver}_i386.deb)
source_x86_64=(http://httpredir.debian.org/debian/pool/main/c/cdebootstrap/${pkgname}_${pkgver}_amd64.deb)
md5sums_i686=('c7bf64d48371314a0b737ee4d0f8c3b3')
md5sums_x86_64=('e7b1aa352c4366bb273a42996e5348e3')

package() {
  tar xJvf ${srcdir}/data.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
