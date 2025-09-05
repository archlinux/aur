# Maintainer: gilcu3
# Previous Maintainer: Frank Bearoff fbearoff at gmail dot com
# Contributor: Frank Bearoff fbearoff at gmail dot com

pkgname=dufs-bin
pkgver=0.45.0
pkgrel=1
pkgdesc='Dufs is a distinctive utility file server that supports static serving, uploading, searching, accessing control, webdav...'
arch=('x86_64' 'aarch64')
url="https://github.com/sigoden/${pkgname%-bin}"
license=('APACHE' 'MIT')
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
source=("https://raw.githubusercontent.com/sigoden/dufs/main/LICENSE-MIT")
sha256sums=('4623d04ec401ec83c94b935d75d8b4329e860580e91ed777ef03a0aa3b31bb04')
sha256sums_x86_64=('cd506e51f06f410661fe07387d1cd5a55ae1ffc00d07c1831b454f415d099699')
sha256sums_aarch64=('f8a75aaa2a855a33c89987ce2134f69eaa6f692d2d64f2458a0f1f9147cc3662')
package() {
  install -Dm755 "dufs" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
