# Maintainer: FadeMind <fademind@gmail.com>

pkgname=networkmanager-dispatcher-ddclient
pkgver=1.0
pkgrel=1
pkgdesc="Dispatcher Script for ddclient"
arch=('any')
license=('MIT')
url="http://www.gnome.org/projects/NetworkManager"
depends=('networkmanager' 'ddclient')
source=("10-ddclient" "LICENSE")
sha256sums=('f2a2dbb1f30cb9f64ef5cbdc4006432aa0ff4e72eba4a138fb7c0d2748d45877'
            '1cab355e4f44252ba9943b18f934a6a06fc24b9fa98fceb85c0f23c104aa5cdd')

package() {
    install -Dm700 ${srcdir}/10-ddclient  ${pkgdir}/etc/NetworkManager/dispatcher.d/10-ddclient
    install -Dm644 ${srcdir}/LICENSE      ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
