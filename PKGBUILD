# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=termshark-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A terminal UI for tshark, inspired by Wireshark"
arch=('x86_64')
url="https://github.com/gcla/termshark"
license=('MIT')
depends=('wireshark-cli')
makedepends=('go')
source=("https://github.com/gcla/termshark/releases/download/v${pkgver}/termshark_${pkgver}_linux_x64.tar.gz")
sha256sums=('a21e19960a0b7eee08ea8a0679890600cbfe2af83afad5d3980926a45dab6bbe')

pkg_dir="termshark_${pkgver}_linux_x64"

package() {
  install -D -m755 ${srcdir}/${pkg_dir}/termshark ${pkgdir}/usr/bin/termshark
}
