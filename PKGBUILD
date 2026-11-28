# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fogping-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Lightweight SmokePing-like network latency monitor with a web UI"
arch=('x86_64')
url="https://github.com/githubflyideas/fogping"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fogping-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('03bfb9131ad4d6f47366be780c88fa02d23284aedec3eb4640c1869578af7e08')

package() {
  install -Dm755 "fogping" "${pkgdir}/usr/bin/fogping"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
