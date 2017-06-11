# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
pkgver=1.0.5
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-owncloud"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-owncloud/releases/download/v${pkgver}/onlyoffice.tar.gz")
sha512sums=("11691b6eb005e4a2e64330e309cfc6e1079b702f1f2158971bf7d0b119e047b011725f7e02381e89b9287048cea66cbb62f7cc8812eaf06512bad3fca894158f")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/onlyoffice" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
