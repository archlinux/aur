# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-audioplayer
pkgver=2.9.0
pkgrel=1
pkgdesc="Audio Player for Nextcloud and ownCloud"
arch=('any')
url="https://rello.github.io/audioplayer"
license=('AGPL3')
depends=('nextcloud')
source=("nextcloud-app-audioplayer-${pkgver}.tar.gz::https://github.com/Rello/audioplayer/archive/${pkgver}.tar.gz")
sha512sums=('4c9beffd84d5bdf71ab06e675766cc638f09ac1a28e405cebf29c538b8743d9acf80cb53fe0892cdf670ce52b469711ecdd00a3bf44b45c65d0954a45ac0bec5')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/audioplayer-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/audioplayer"
}
