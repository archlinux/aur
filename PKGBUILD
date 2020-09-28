# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-keeweb
pkgver=0.6.3
pkgrel=1
pkgdesc="Open Keepass stores inside Nextcloud"
arch=('any')
url="https://github.com/jhass/nextcloud-keeweb"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/jhass/nextcloud-keeweb/releases/download/v${pkgver}/keeweb-${pkgver}.tar.gz")
sha512sums=('5a04f52e0dec7304ef71196deda755443a1fcde17523da04ab3f0e208dc57d31f9b6a2dcf3f24ed8720708c26cbdc49ee63b3b03a1583d604c763e8dd2ffbc19')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/keeweb" "${pkgdir}/usr/share/webapps/nextcloud/apps/keeweb"
}
