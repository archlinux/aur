pkgname=nextcloud-app-richdocuments
pkgver=8.0.1
pkgrel=1
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/nextcloud-releases/richdocuments"
license=('AGPL')
depends=('nextcloud>=26' 'nextcloud<27' 'nodejs' 'npm')
makedepends=()
options=('!strip')
source=("richdocuments-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/richdocuments-v${pkgver}.tar.gz")
sha512sums=('3dbb7b805de895da5a9d12e6221e2c3f3439d3faac712404c7f306913ec7c160ece4e29d310c12908ac8212c263d163273ae5f26dd150777a59e2b8f29ab49ae')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocuments" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}
