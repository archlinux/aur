# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
pkgver=1.1.5
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-owncloud"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-owncloud/releases/download/v${pkgver}/onlyoffice-nextcloud.tar.gz")
sha512sums=("2289f17ed2a4f856dd57f1c01905a924728045353145350dbc1bf0bbc3c5d6a04c90e5c73353c65bde67b75545ac8deea17e8c99f0862af95fa842e7427732ef")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/onlyoffice" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
