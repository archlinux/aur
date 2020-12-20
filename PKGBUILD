# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-twitter
pkgver=0.0.6
pkgrel=1
pkgdesc="Twitter integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_twitter"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_twitter/releases/download/v${pkgver}/integration_twitter-${pkgver}.tar.gz")
sha512sums=('bc9a48555af3f252fa991a1a45386847b20cd30cf7e9e9d729e015d79ccf0a6829ad056a0376cfcd4f3e2b0ed05eddb53dd29ec57dc8f74e280da93f41caba7b')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_twitter" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_twitter"
}
