# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=ijq-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='Interactive jq tool. Like jqplay for the commandline'
arch=('x86_64')
license=('GPL3')
url='https://git.sr.ht/~gpanders/ijq'
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/refs/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x86_64.tar.gz")

sha256sums_x86_64=('7e1f744733f36ee61895bd00d43a734895d83b42b12b55e7947fc30b2d53f8a0')

package() {
  install -Dm755 "${srcdir}/ijq-${pkgver}/ijq" "${pkgdir}/usr/bin/ijq"
}
