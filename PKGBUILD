# Maintainer: WaffleFrisbee <dev@longfam.org>
pkgname=jellyfin-server-openrc
pkgver=1.0
pkgrel=1
pkgdesc="jellyfin server openrc service"
arch=('any')
url='https://github.com/WaffleFrisbee/jellyfin-server-openrc'
license=('custom:WTFPL')
depends=('openrc')
source=("jellyfind.initd")
sha256sums=('85cd9f9ac0a616195219edc829ef88d87f30e7036a62ecf51c17c49342a61444')

package() {
  install -Dm755 ${srcdir}/jellyfind.initd "$pkgdir"/etc/init.d/jellyfind
  install=jellyfind.install
}