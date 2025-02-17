# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
_pkgname=onlyoffice
pkgver=9.6.0
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-nextcloud"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-nextcloud/releases/download/v$pkgver/onlyoffice.tar.gz")
sha512sums=('283cf6c1fb4b383ddafb9b042ac276bac3ee7b5bdb750c310e8e9e30986dd4d00976a04a9fdddc00c4fa8d6eb0302aec9122cc51e4c623a58418babba0c83ba5')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
