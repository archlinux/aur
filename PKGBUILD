# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-extract
pkgver=1.2.0
pkgrel=1
pkgdesc="Bring extraction to your nextcloud web interface"
arch=('any')
url="https://github.com/PaulLereverend/NextcloudExtract"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("extract-${pkgver}.tar.gz::https://github.com/PaulLereverend/NextcloudExtract/releases/download/${pkgver}/extract.tar.gz")
sha512sums=("6d94c2f3b9dbd88c8b3ba8fdbf998087f66cbb5996cd1a14e617ff9542d1a99028e86fa37ac72de80854faac526b9e1c105f2419ff04e61a5020090a791022d5")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/extract" "${pkgdir}/usr/share/webapps/nextcloud/apps/extract"
}
