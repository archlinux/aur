# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-onlyoffice
_pkgname=onlyoffice
pkgver=9.0.0
pkgrel=2
pkgdesc="Integrate ONLYOFFICE documentserver into NextCloud"
arch=('any')
url="https://github.com/ONLYOFFICE/onlyoffice-nextcloud"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/onlyoffice-nextcloud/releases/download/v$pkgver/onlyoffice.tar.gz")
sha512sums=('89fa71ed13e2d09fecb427ec3a451593198a82b18f272d1ec3f063ab5c9e539f530906377aeab52fb48834f04ee60f9dd3a0f93973a8c3cee230d43b358fec50')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -ra "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/onlyoffice"
}
