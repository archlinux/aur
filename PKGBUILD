# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=ijq-bin
pkgver=1.1.2
pkgrel=1
pkgdesc='Interactive jq tool. Like jqplay for the commandline'
arch=('x86_64')
license=('GPL3')
url='https://git.sr.ht/~gpanders/ijq'
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/refs/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")

sha256sums_x86_64=('26b93929b72938d0f2b1d62cd9fea1e8caadaacfd4c155aa515242ae028e6654')

package() {
  install -Dm755 "${srcdir}/ijq-${pkgver}/ijq" "${pkgdir}/usr/bin/ijq"
  install -Dm644 "${srcdir}/ijq-${pkgver}/ijq.1" "${pkgdir}/usr/share/man/man1/ijq.1"
}
