# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=nextcloud-app-bookmarks
_app=bookmarks
pkgver=0.9.1
pkgrel=1
pkgdesc="Bookmark app for Nextcloud & ownCloud"
arch=('any')
url="https://github.com/nextcloud/bookmarks"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/${_app}/releases/download/v${pkgver}/${_app}-${pkgver}.tar.gz")
sha512sums=('e1f243c1776fe472cc14c4f13e3c60be51ce9cca29e58aa2829912f5614e38ac4fbe344b15f78449f3fa727ac62899081a59821fd07decc5ff53d83891129d5f')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -R "${srcdir}/${_app}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_app}"
}
