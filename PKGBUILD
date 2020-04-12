# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=1.3.0
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-poll-${pkgver}.tar.gz::https://github.com/nextcloud/polls/releases/download/v${pkgver}/polls.tar.gz")
sha512sums=("e9b409fa224556353f56e6e1e02e160e19e7fab1a5ec453ecf66e8a7e00219be2cbbf7d3a323a7011283dc052d62174f4257d1973d833fa1334d3e85110e1239")

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/polls" "${pkgdir}/usr/share/webapps/nextcloud/apps/polls"
}
