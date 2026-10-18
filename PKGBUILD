# Maintainer: gilcu3
# Previous Maintainer: Frank Bearoff fbearoff at gmail dot com
# Contributor: Frank Bearoff fbearoff at gmail dot com

pkgname=dufs-bin
pkgver=0.47.0
pkgrel=1
pkgdesc='Dufs is a distinctive utility file server that supports static serving, uploading, searching, accessing control, webdav...'
arch=('x86_64' 'aarch64')
url="https://github.com/sigoden/${pkgname%-bin}"
provides=('dufs')
conflicts=('dufs')
license=('APACHE' 'MIT')
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
source=("https://raw.githubusercontent.com/sigoden/dufs/main/LICENSE-MIT")
sha256sums=('4623d04ec401ec83c94b935d75d8b4329e860580e91ed777ef03a0aa3b31bb04')
sha256sums_x86_64=('c715c44b195f6133ca0f47e6fdc8d6015ec64b7fd9ac8e1c578ca23a92206aa4')
sha256sums_aarch64=('faf1c961ad47c5d636b14956b6279e1278453517cd5d3c274d21d522b495800a')
package() {
  install -Dm755 "dufs" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
