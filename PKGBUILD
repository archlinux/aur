# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
_pkgname=onlyoffice-nextcloud
pkgver=6.0.0
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-nextcloud"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-nextcloud/archive/v${pkgver}.tar.gz")
sha512sums=('868013a2618239c61cc8bf3f56e737f994c3fec4315d135e4a02d8ac958816f24c0707b0d4b476c13955c4920f2f331f9efa6b1390b846a55fa0408bc9aedebd')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
