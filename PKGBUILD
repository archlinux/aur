pkgname=nextcloud-app-richdocuments
pkgver=6.2.0
pkgrel=2
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/nextcloud-releases/richdocuments"
license=('AGPL')
depends=('nextcloud>=24' 'nodejs' 'npm')
makedepends=()
options=('!strip')
source=("richdocuments-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/richdocuments-v${pkgver}.tar.gz")
sha512sums=('2c4e56005a411c183f8f57ec6fefc74c13a7acf0c2700d2d7cacf04d59a8a0f586f2eb60964ded49baf1436331e090e7d522b41af717123bd8d511b6772f5b4c')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocuments" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}
