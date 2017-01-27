# Maintainer: Fabian Beuke <mail@beuke.org>
pkgname=dripcap
pkgver=0.6.4
pkgrel=1
arch=('x86_64')
pkgdesc="Caffeinated Packet Analyzer"
url="https://dripcap.org/"
license=('MIT')
depends=('wget')
sha1sums=('c73c0b7ca19bb2c1fc1042e304ba49545cf8b194')
source=("https://github.com/dripcap/dripcap/releases/download/v${pkgver}/dripcap-linux-amd64.deb")

package() {
  bsdtar xf data.tar.gz
  chmod -R g-w usr
  mv usr "${pkgdir}"
}
