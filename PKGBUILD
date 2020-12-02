# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=avpnc
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="A python implementation of the Aviatrix VPN client"
arch=('any')
url=https://github.com/christophgysin/avpnc
license=('MIT')
depends=('python' 'sudo' 'openvpn')
source=("avpnc-$pkgver.tar.gz::https://github.com/christophgysin/avpnc/archive/v$pkgver.tar.gz")
sha512sums=('665cb7dcf3e6f5a53a868d9bdd7236f66cbc19883b9443e4fa25b9b273b586441dc7f79ef02bd9132c9bf433810fe02c2c604e4780f8ba8b0367ef8eb117109e')

package() {
  install -Dm755 ${srcdir}/avpnc-${pkgver}/avpnc ${pkgdir}/usr/bin/avpnc
}
