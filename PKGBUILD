# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-extract
pkgver=1.2.4
pkgrel=1
pkgdesc="Bring extraction to your nextcloud web interface"
arch=('any')
url="https://github.com/PaulLereverend/NextcloudExtract"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("extract-${pkgver}.tar.gz::https://github.com/PaulLereverend/NextcloudExtract/releases/download/${pkgver}/extract.tar.gz")
sha512sums=('a57529786638a0c89358cb0c7cdc70c8b508e94ada925c1894e76a6096b1547b5c52ae65c06d14c58eb62de846f1f8e0b3c7194e1fcd16fe7e0ef5251a10062c')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/extract" "${pkgdir}/usr/share/webapps/nextcloud/apps/extract"
}
