# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
_pkgname=onlyoffice
pkgver=9.4.0
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-nextcloud"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-nextcloud/releases/download/v$pkgver/onlyoffice.tar.gz")
sha512sums=('c83059e2fd824af33f15d24ece3b005866ff8303748b5980504e73d9003ee82bfd5a60ab78c5ff984c6764a4a824b025d55a036a56324ba4394332c9f2c5f8b6')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
