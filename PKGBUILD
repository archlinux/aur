# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-twitter
pkgver=0.0.7
pkgrel=1
pkgdesc="Twitter integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_twitter"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_twitter/releases/download/v${pkgver}/integration_twitter-${pkgver}.tar.gz")
sha512sums=('d4cc6812a0920ddd958c79bbb9ca4f336fa91e675634df45f02eb7191f18848327d5e6603ca991bc2239b2f65965793b853f0c5877158a2e62e7031dba0fe01d')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_twitter" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_twitter"
}
