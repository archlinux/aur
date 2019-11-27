# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=termshark-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A terminal UI for tshark, inspired by Wireshark"
arch=('x86_64')
url="https://github.com/gcla/termshark"
license=('MIT')
depends=('wireshark-cli')
makedepends=()
provides=('termshark')
source=("https://github.com/gcla/termshark/releases/download/v${pkgver}/termshark_${pkgver}_linux_x64.tar.gz")
sha256sums=('8fe396f36b220f74d05cb26210b631822ba3bf0cd90e7762c7f20a1b4fe39e62')

pkg_dir="termshark_${pkgver}_linux_x64"

package() {
  install -D -m755 ${srcdir}/${pkg_dir}/termshark ${pkgdir}/usr/bin/termshark
}
