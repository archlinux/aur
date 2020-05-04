# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=1.4.3
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-poll-${pkgver}.tar.gz::https://github.com/nextcloud/polls/releases/download/v${pkgver}/polls.tar.gz")
sha512sums=("f6929243c5417a8c650a05ca0620d3457dd8f1c745c093e0c61ada61bb08c533e3b3c0b1d211c023484e550891da617ff6d08b7045395ae0350ab9b442bdf3c7")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/polls" "${pkgdir}/usr/share/webapps/nextcloud/apps/polls"
}
