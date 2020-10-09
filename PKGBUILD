# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-twitter
pkgver=0.0.3
pkgrel=1
pkgdesc="Twitter integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_twitter"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_twitter/releases/download/v${pkgver}/integration_twitter-${pkgver}.tar.gz")
sha512sums=('aaa8f3bb530b551c7fbb5fd089f017892633b823f38a941ec1d5dbe7caae550c95071fd348aac5f9d808df785b3046a5501c0b8ae822d0cea372ec699cab7ad8')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_twitter" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_twitter"
}
