# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-deck
pkgver=0.5.2
pkgrel=1
pkgdesc="Kanban-style project & personal management tool for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/deck"
license=('AGPLv3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nextcloud/deck/releases/download/v${pkgver}/deck.tar.gz")
sha512sums=("68dc6508ce29155c2d8099fc7951afc3cb3881c8cc7c579946ceb008a71a2a69d54b955bb907b0cb255b256611e3abbbc00f7765d02c878fe4c0ae0162fac2fd")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/deck" "${pkgdir}/usr/share/webapps/nextcloud/apps/deck"
}
