# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=unfake.js-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Fix AI-generated pixel art and vector images"
arch=('x86_64')
url="https://github.com/jenissimo/unfake.js"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/unfake-cli-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('0c118152fc49f92ba81c6f5b9c7da7ebbb53bde448c1170cbb396dd7b2f81389')

package() {
  install -Dm755 "unfake" "${pkgdir}/usr/bin/unfake"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
