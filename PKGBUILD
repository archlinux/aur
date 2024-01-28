# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=ijq-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Interactive jq tool. Like jqplay for the commandline'
arch=('x86_64')
license=('GPL3')
url='https://git.sr.ht/~gpanders/ijq'
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/refs/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")

sha256sums_x86_64=('5e4d536fc0520916a87b0551647f2d1944ea1c130eb919b5e5543b9b15f6439b')

package() {
  install -Dm755 "${srcdir}/ijq-${pkgver}/ijq" "${pkgdir}/usr/bin/ijq"
  install -Dm644 "${srcdir}/ijq-${pkgver}/ijq.1" "${pkgdir}/usr/share/man/man1/ijq.1"
}
