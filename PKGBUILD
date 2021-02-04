# Maintainer: ServiusHack <serviushack at gmx dot de>
pkgname=casparcg-client-bin
pkgver=2.0.8
pkgrel=1
pkgdesc='A client software used to control the CasparCG Server software'
arch=('x86_64')
url='http://www.casparcg.com/'
license=('GPL')
depends=('vlc')
source=('https://sourceforge.net/projects/casparcg/files/CasparCG_Client/CasparCG_Client_2.0/CasparCG_Client_2.0.8_Linux.tar.gz' 'casparcg-client')
sha256sums=('2af7a888bf5e6fbcab77be2501c3878d3fa057aeb8fab87131f5f8051fe24fa4' '8c5b1a9104ae09895e3b71d5a250a5db0e4611181aa53103d6bbde40cd76ab5c')

package() {
  mkdir -p "$pkgdir/opt"
  cp -r "$srcdir/CasparCG Client 2.0.8/" "$pkgdir/opt/casparcg-client"
  mkdir -p "$pkgdir/usr/bin"
  cp casparcg-client "$pkgdir/usr/bin/"
}
