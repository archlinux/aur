# Maintainer: Fabian Beuke <fabianbeuke@gmail.com>
pkgname=dripcap
pkgver=0.4.0
pkgrel=1
pkgdesc="Caffeinated Packet Analyzer"
arch=('x86_64')
url='https://github.com/dripcap/dripcap'
license=('MIT')
depends=('wget')
srouce=(https://github.com/dripcap/dripcap/releases/download/v${pkgver}/dripcap-linux-amd64.deb)

package() {
  ar vx dripcap-linux-amd64.deb
  bsdtar xf data.tar.gz
  chmod -R g-w usr
  mv usr "${pkgdir}"
}
