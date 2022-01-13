# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mole-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="CLI app to create SSH tunnels"
arch=('x86_64')
url='https://davrodpin.github.io/mole'
depends=('glibc')
license=('MIT')
provides=('mole')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/davrodpin/mole/releases/download/v${pkgver}/mole${pkgver}.linux-amd64.tar.gz"
    'https://raw.githubusercontent.com/davrodpin/mole/master/LICENSE')
sha256sums=('fd38d9f529181651b230c013825849fc467292fa11c44b27b0c21c579f883d82'
            '7e7839a3eb39cd8fa942a0ceeeac3ad214ec7d03b4be72da318ca0c15b1fb3a7')

package() {
  install -Dm755 "${srcdir}"/mole "${pkgdir}/usr/bin/mole"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
