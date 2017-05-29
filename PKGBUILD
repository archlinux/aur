# Maintainer: Fabian Beuke <mail@beuke.org>
pkgname=dripcap
pkgver=0.6.15
pkgrel=1
arch=('x86_64')
pkgdesc="Caffeinated Packet Analyzer"
url="https://dripcap.org/"
license=('MIT')
depends=('wget')
sha1sums=('2fb97edbae959a1e89f60796fb2e1e9a47eea5b0')
source=("https://github.com/dripcap/dripcap/releases/download/v${pkgver}/dripcap-linux-amd64.deb")

package() {
  bsdtar xf data.tar.gz
  chmod -R g-w usr
  mv usr "${pkgdir}"
}
