# Maintainer: ServiusHack <serviushack at gmx dot de>
pkgname=casparcg-client-bin
pkgver=2.3.1
pkgrel=1
pkgdesc='A client software used to control the CasparCG Server software'
arch=('x86_64')
url='http://www.casparcg.com/'
license=('GPL-3.0-or-later')
depends=('vlc' 'boost174-libs')
source=("https://github.com/CasparCG/client/releases/download/v${pkgver}/casparcg-client-v${pkgver}-ubuntu22.deb")
sha256sums=('4c3a165e9c96e3d1ac12cb1411789fbdd9728f20b180f428f42b8ee86cbecc56')

package() {
  ar x casparcg-client-v${pkgver}-ubuntu22.deb
  tar -C "$pkgdir" -xvzf data.tar.gz
}
