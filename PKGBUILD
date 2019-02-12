# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-keeweb
pkgver=0.5.0
pkgrel=1
pkgdesc="Open Keepass stores inside Nextcloud"
arch=('any')
url="https://github.com/jhass/nextcloud-keeweb"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/jhass/nextcloud-keeweb/releases/download/v${pkgver}/keeweb-${pkgver}.tar.gz")
sha512sums=("a19ae97b26c01696e009236e98e757d85936eb1cd252175a796f04ddc90cbe7f90154f2bbdbb929ecddd9612a032630cef1046866d03380cfa2bd3e40fadfd94")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/keeweb" "${pkgdir}/usr/share/webapps/nextcloud/apps/keeweb"
}
