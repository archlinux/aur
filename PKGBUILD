pkgname=nextcloud-app-richdocuments
pkgver=5.0.4
pkgrel=1
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/nextcloud/richdocuments"
license=('AGPL')
depends=('nextcloud' 'libreoffice-online')
makedepends=()
options=('!strip')
source=("richdocuments-${pkgver}.tar.gz::https://github.com/nextcloud/richdocuments/releases/download/v$pkgver/richdocuments.tar.gz")
sha512sums=('88987d1e7a8d65b2ffd5881b14049c495483647799bfbbf2dbd699e2ba5ec426ab1bd4c88b615e04eba4162c919a8bbb6dc6cf12d031fca63da7988da76e24bc')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocuments" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}
