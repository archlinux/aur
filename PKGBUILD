# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-integration-reddit
pkgver=0.0.5
pkgrel=1
pkgdesc="Reddit integration into Nextcloud"
arch=('any')
url="https://github.com/nextcloud/integration_reddit"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/nextcloud/integration_reddit/releases/download/v${pkgver}/integration_reddit-${pkgver}.tar.gz")
sha512sums=('a0473d6f06196767d0b16ad1a74da0bd037fe97c29e45e230c04b6721bd025e0028cec3b1b0b49e4738cfa17a21bcb8ee0063b9cc531805b6b4f53f464ad3f60')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/integration_reddit" "${pkgdir}/usr/share/webapps/nextcloud/apps/integration_reddit"
}
