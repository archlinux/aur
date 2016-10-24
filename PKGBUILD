# Maintainer: Fabian Beuke <fabianbeuke@gmail.com>
pkgname=dripcap
pkgver=0.4.0
pkgrel=1
pkgdesc="Caffeinated Packet Analyzer"
arch=('x86_64')
url='https://github.com/dripcap/dripcap'
license=('MIT')
depends=('wget')
sha256sums=('b1dfdf03381918ce3e5f77e1111c78ae7cc7fdd00c2432bfeb98de0dd0ca55ae')
srouce=(https://github.com/dripcap/dripcap/releases/download/v${pkgver}/dripcap-linux-amd64.deb)

package() {
  bsdtar xf data.tar.gz
  chmod -R g-w usr
  mv usr "${pkgdir}"
}
