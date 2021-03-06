# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-extract
pkgver=1.3.1
pkgrel=1
pkgdesc="Bring extraction to your nextcloud web interface"
arch=('any')
url="https://github.com/PaulLereverend/NextcloudExtract"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("extract-${pkgver}.tar.gz::https://github.com/PaulLereverend/NextcloudExtract/releases/download/${pkgver}/extract.tar.gz")
sha512sums=('8979291774642a63b8f8d69f63b7ee5aeaea98c9906151a33abfb888ad63537f302a51bd2a947dccee423abd260ac0f821bb19ec17d25aa8f22fe632924769f8')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/extract" "${pkgdir}/usr/share/webapps/nextcloud/apps/extract"
}
