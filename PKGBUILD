# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=ijq-bin
pkgver=0.2.4
pkgrel=1
pkgdesc='Interactive jq tool. Like jqplay for the commandline'
arch=('x86_64')
license=('GPL3')
url='https://git.sr.ht/~gpanders/ijq'
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/refs/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x86_64.tar.gz")

sha256sums_x86_64=('b277b2d8f0f8e2eca1283eab4ff1696cb2db58ff85f145af07e125b2f995c9bd')

package() {
  install -Dm755 "${srcdir}/ijq-${pkgver}/ijq" "${pkgdir}/usr/bin/ijq"
  install -Dm644 "${srcdir}/ijq-${pkgver}/ijq.1" "${pkgdir}/usr/share/man/man1/ijq.1"
}
