# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=avpnc
pkgver=0.2
pkgrel=1
epoch=1
pkgdesc="A python implementation of the Aviatrix VPN client"
arch=('any')
url=https://github.com/christophgysin/avpnc
license=('MIT')
depends=('python' 'sudo' 'openvpn')
source=("avpnc-$pkgver.tar.gz::https://github.com/christophgysin/avpnc/archive/v$pkgver.tar.gz")
sha512sums=('249002010ff4613ca79b487af2f138e4fa2f62fb23ffba0f6530c4004d9a430893f299b50931ff711083caaac477c565d7b72048f71c1ea783dd41d0ca1db079')

package() {
  install -Dm755 ${srcdir}/avpnc-${pkgver}/avpnc ${pkgdir}/usr/bin/avpnc
}
