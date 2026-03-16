# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=cdebootstrap-static
pkgver=0.7.9+b10
pkgrel=1
pkgdesc="Bootstrap a Debian system"
arch=('i686' 'x86_64')
url="http://packages.debian.org/search?keywords=cdebootstrap"
license=('GPL')
depends=('wget' 'gnupg')
optdepends=('debian-archive-keyring')

source_i686=(http://httpredir.debian.org/debian/pool/main/c/cdebootstrap/${pkgname}_${pkgver}_i386.deb)
source_x86_64=(http://httpredir.debian.org/debian/pool/main/c/cdebootstrap/${pkgname}_${pkgver}_amd64.deb)
sha256sums_i686=('70779c655b45e40a9a730530c060deedb46f93a031ffd6d9613da9b83f2cecfe')
sha256sums_x86_64=('ed8f217856c72f239054ed1ee79a252de6c66a6d13762a7e9a7f518b03c3c56f')

package() {
  tar xJvf ${srcdir}/data.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
