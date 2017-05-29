# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
pkgver=1.0.4
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-owncloud"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-owncloud/releases/download/v${pkgver}/onlyoffice.tar.gz")
sha512sums=("3949d63a03f1c09c973daf20e051a0e5d56366a5994d68e631433c52f365cd5961e0439f099f3cb3179db7930251ceaba4fafcbbd12e5c7f3db30696b7d369de")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/onlyoffice" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
