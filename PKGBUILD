# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-audioplayer
pkgver=2.13.1
pkgrel=1
pkgdesc="Audio Player for Nextcloud and ownCloud"
arch=('any')
url="https://rello.github.io/audioplayer"
license=('AGPL3')
depends=('nextcloud')
source=("nextcloud-app-audioplayer-${pkgver}.tar.gz::https://github.com/Rello/audioplayer/archive/${pkgver}.tar.gz")
sha512sums=('ab5be9ac7866cfde516058e576ffaf3bae66bdab4c03abb7e4c7fb78d6eec4032d2b456e1d1528f83d9f95298bfe2543361c3b2bd5e671819282f5f711ecdd3b')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/audioplayer-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/audioplayer"
}
