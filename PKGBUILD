# Maintainer: Fabian Beuke <mail@beuke.org>
pkgname=dripcap
pkgver=0.4.9
pkgrel=1
arch=('x86_64')
pkgdesc="Caffeinated Packet Analyzer"
url="https://dripcap.org/"
license=('MIT')
depends=('wget')
sha1sums=('c3877f607a4084c5c9ff278358e0ec8466570618')
source=("https://github.com/dripcap/dripcap/releases/download/v${pkgver}/dripcap-linux-amd64.deb")

package() {
  bsdtar xf data.tar.gz
  chmod -R g-w usr
  mv usr "${pkgdir}"
}
