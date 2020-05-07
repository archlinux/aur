# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mole-bin
pkgver=0.5.0
pkgrel=3
pkgdesc="CLI app to create SSH tunnels"
arch=('x86_64')
url='https://davrodpin.github.io/mole'
depends=('glibc')
license=('MIT')
provides=('mole')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/davrodpin/mole/releases/download/v${pkgver}/mole${pkgver}.linux-amd64.tar.gz"
		'https://raw.githubusercontent.com/davrodpin/mole/master/LICENSE')
sha256sums=('3d9398791f00878bb77bfaee9d84dd5c93755f639fbe592b7b655ec4f5889edd'
			'7e7839a3eb39cd8fa942a0ceeeac3ad214ec7d03b4be72da318ca0c15b1fb3a7')

package() {
  install -Dm755 "${srcdir}"/mole "${pkgdir}/usr/bin/mole"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}