# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mole-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI app to create SSH tunnels"
arch=('x86_64')
url='https://davrodpin.github.io/mole/'
license=('MIT')
provides=('mole')
source=("https://github.com/davrodpin/mole/releases/download/v${pkgver}/mole${pkgver}.linux-amd64.tar.gz")
md5sums=('36b2bf3dfbd50354644e2156172f9015')

package() {
  cd "${srcdir}"
  install -Dm755 mole "${pkgdir}/usr/bin/mole"
}