# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=cdebootstrap-static
pkgver=0.7.6
pkgrel=1
pkgdesc="Bootstrap a Debian system"
arch=('i686' 'x86_64')
url="http://packages.debian.org/search?keywords=cdebootstrap"
license=('GPL')
depends=('wget' 'gnupg')
optdepends=('debian-archive-keyring')

source_i686=(http://httpredir.debian.org/debian/pool/main/c/cdebootstrap/${pkgname}_${pkgver}_i386.deb)
source_x86_64=(http://httpredir.debian.org/debian/pool/main/c/cdebootstrap/${pkgname}_${pkgver}_amd64.deb)
md5sums_i686=('3d8ee6748e3c786eba06008cfb25275d')
md5sums_x86_64=('5d68f94ce5009eb10f3ed844471538b6')

package() {
  tar xJvf ${srcdir}/data.tar.xz -C ${pkgdir}/
}

# vim:set ts=2 sw=2 et:
