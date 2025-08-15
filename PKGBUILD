# Maintainer: gilcu3
# Previous Maintainer: Frank Bearoff fbearoff at gmail dot com
# Contributor: Frank Bearoff fbearoff at gmail dot com

pkgname=dufs-bin
pkgver=0.44.0
pkgrel=3
pkgdesc='Dufs is a distinctive utility file server that supports static serving, uploading, searching, accessing control, webdav...'
arch=('x86_64' 'aarch64')
url="https://github.com/sigoden/${pkgname%-bin}"
license=('APACHE' 'MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-${arch}-unknown-linux-musl.tar.gz"
  "https://raw.githubusercontent.com/sigoden/dufs/main/LICENSE-MIT")
sha256sums=('8d06c07a0d40c90e5386837462640c89e409ef161d6342e453644ec1e888ad27'
            '4623d04ec401ec83c94b935d75d8b4329e860580e91ed777ef03a0aa3b31bb04')
package() {
  install -Dm755 "dufs" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
