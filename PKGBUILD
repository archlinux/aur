pkgname=nextcloud-app-richdocuments
pkgver=6.0.0
pkgrel=2
pkgdesc="Integrate Collabora Online into NextCloud"
arch=('any')
url="https://github.com/nextcloud/richdocuments"
license=('AGPL')
depends=('nextcloud>=24' 'nodejs' 'npm')
makedepends=()
options=('!strip')
source=("richdocuments-${pkgver}.tar.gz::https://github.com/nextcloud/richdocuments/releases/download/v$pkgver/richdocuments.tar.gz")
sha512sums=('a642791c0d8a3f894439b201f579c162fe042959a540b23ac61ad02db8e013a0edf860e2f37336f45974eaf5c6277489d7fdee0dba3d13eed389209410f9d413')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/richdocuments" "${pkgdir}/usr/share/webapps/nextcloud/apps/richdocuments"
}
