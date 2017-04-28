# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
pkgver=1.0.3
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-owncloud"
license=('GPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-owncloud/releases/download/v${pkgver}/onlyoffice.tar.gz")
sha512sums=("3313a7b2192349946b7f04ef93fc77e1a74a385a8da50a8916c52f85a6938ad0a749f1dd6e21f525bd92c98c8515bc234a2c5c6c53868533be147094854b4367")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/onlyoffice" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
