# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-extract
pkgver=1.3.2
pkgrel=1
pkgdesc="Bring extraction to your nextcloud web interface"
arch=('any')
url="https://github.com/PaulLereverend/NextcloudExtract"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("extract-${pkgver}.tar.gz::https://github.com/PaulLereverend/NextcloudExtract/releases/download/${pkgver}/extract.tar.gz")
sha512sums=('ec8d5d508bcbed837dd98774989fede072374d83919ab1ad2bc0dedc707053c03aec73c282e7b8f96379760bf2146ca4929f8f33c7a3e5d66481936c28aa1437')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/extract" "${pkgdir}/usr/share/webapps/nextcloud/apps/extract"
}
