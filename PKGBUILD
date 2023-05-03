pkgname=nextcloud-app-groupfolders
pkgver=14.0.2
pkgrel=1
pkgdesc="Admin-configured folders shared by everyone in a group."
arch=('any')
url="https://github.com/nextcloud-releases/groupfolders"
license=('AGPL')
depends=('nextcloud>=26' 'nextcloud<27')
options=('!strip')
source=("groupfolders-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8eb6addf22302e56f88b4c2e08b28bec85a98a4505c1d1a8818fa25110d27519d85d025aed1408d76d9a610733bf6dc6647978bcd6407803212ffa5d7d35364b')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/groupfolders-${pkgver}" "${pkgdir}/usr/share/webapps/nextcloud/apps/groupfolders"
}
