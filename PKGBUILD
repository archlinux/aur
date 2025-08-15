# Maintainer: gilcu3
# Previous Maintainer: Frank Bearoff fbearoff at gmail dot com
# Contributor: Frank Bearoff fbearoff at gmail dot com

pkgname=dufs-bin
pkgver=0.44.0
pkgrel=4
pkgdesc='Dufs is a distinctive utility file server that supports static serving, uploading, searching, accessing control, webdav...'
arch=('x86_64' 'aarch64')
url="https://github.com/sigoden/${pkgname%-bin}"
license=('APACHE' 'MIT')
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
source=("https://raw.githubusercontent.com/sigoden/dufs/main/LICENSE-MIT")
sha256sums=('4623d04ec401ec83c94b935d75d8b4329e860580e91ed777ef03a0aa3b31bb04')
sha256sums_x86_64=('8d06c07a0d40c90e5386837462640c89e409ef161d6342e453644ec1e888ad27')
sha256sums_aarch64=('08c0907d728e0fb06671607fa2026f9a9daca0b5d10644a2051536328b9032cb')
package() {
  install -Dm755 "dufs" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
