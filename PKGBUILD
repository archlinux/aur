# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=ppp-hook-openvpn
pkgver=0.0.2
pkgrel=2
pkgdesc='Hook for ppp to reconnect openvpn upon connection'
arch=('any')
depends=('openvpn' 'ppp')
url='http://www.eworm.de/'
license=('GPL')
source=('ip-up.sh')
sha256sums=('82c0e822b23743e3d50289adb19ee63bd14f1186c2a0fc0921977f64b535332a')

build() {
	install -D -m 0755 ${srcdir}/ip-up.sh ${pkgdir}/etc/ppp/ip-up.d/02-openvpn.sh
}

