pkgname=nextcloud-app-groupfolders
pkgver=13.0.0
pkgrel=1
pkgdesc="Admin-configured folders shared by everyone in a group."
arch=('any')
url="https://github.com/nextcloud/groupfolders"
license=('AGPL')
depends=('nextcloud>=25' 'nextcloud<26')
makedepends=()
options=('!strip')
source=("groupfolders-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/groupfolders.tar.gz")
sha512sums=('3c55b4851251b033ae03eb62708391761a43004861838b4250749734e5ac491534b2e6879bc54e392922e20254ce808c56c886ca0f1f04f0e21106e0b9f719d2')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/groupfolders" "${pkgdir}/usr/share/webapps/nextcloud/apps/groupfolders"
}
