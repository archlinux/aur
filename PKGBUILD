# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
_pkgname=onlyoffice-nextcloud
pkgver=2.0.2
pkgrel=1
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-nextcloud"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-nextcloud/archive/v${pkgver}.tar.gz")
sha512sums=("168e396a59389ce7b57f3feb9e31cb06b635f1a8a76edfd4465d01807142e60d530beb82747dd77be6e3284596ebe6ea92aad894a4f634ad376a98f4aa0ba62a")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
