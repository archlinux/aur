# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-audioplayer
pkgver=3.1.0
pkgrel=1
pkgdesc="Audio Player for Nextcloud and ownCloud"
arch=('any')
url="https://rello.github.io/audioplayer"
license=('AGPL3')
depends=('nextcloud')
source=("nextcloud-app-audioplayer-${pkgver}.tar.gz::https://github.com/Rello/audioplayer/archive/${pkgver}.tar.gz")
sha512sums=('02ac587f16dfee91837789e83ab64e51a14be3d3aee7881a6fb1bd1ce587c6aef99f319f82997af465989dfd74d3fd69226a6c86145a0b8b778532102b3fdc58')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/audioplayer-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/audioplayer"
}
