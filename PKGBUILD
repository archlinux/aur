# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fastctx-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="Fast, context-efficient repository tools for AI agents over MCP"
arch=('x86_64')
url="https://github.com/yc-duan/fastctx"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fastctx-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6c8f3c8df4c168e760c379f0b2037b1495711764039b827b0c23f8c2f5e13cee')

package() {
  install -Dm755 "fastctx" "${pkgdir}/usr/bin/fastctx"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
