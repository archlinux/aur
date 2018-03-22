# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
pkgver=1.3.0
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-owncloud"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-owncloud/releases/download/v${pkgver}/onlyoffice-nextcloud.tar.gz")
sha512sums=("f419db3d2dbe368716f92b320926d2605e0d47b2600be73343ea370d88976e47bb49c58bfd11f9f56d9bd076b118937db093693bfd12e35a27f7b15bc27cc9ca")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/onlyoffice" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
