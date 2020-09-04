# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
_pkgname=onlyoffice-nextcloud
pkgver=5.0.0
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-nextcloud"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-nextcloud/archive/v${pkgver}.tar.gz")
sha512sums=('193c03fa003f90eaf59e5f85d8270f6bd57ab17587bb90efed646cac226590b497a7c39e8306d5217b4a3e9a63f1232a1c7a9e66e24e3b821bbdcbf56b9b1475')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
