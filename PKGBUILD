# Maintainer: Frank Bearoff fbearoff at gmail dot com

pkgname=dufs-bin
pkgver=v0.34.2
pkgrel=1
pkgdesc='Dufs is a distinctive utility file server that supports static serving, uploading, searching, accessing control, webdav...'
arch=('x86_64')
url="https://github.com/sigoden/${pkgname%-bin}"
license=('APACHE' 'MIT')
depends=()
source=("${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-x86_64-unknown-linux-musl.tar.gz"
	"https://raw.githubusercontent.com/sigoden/dufs/main/LICENSE-MIT")
sha256sums=('ca8f51a2918b42b3a35ee01a9b65944a835c24d2bcda14678eda3db27a305d2e'
            '4623d04ec401ec83c94b935d75d8b4329e860580e91ed777ef03a0aa3b31bb04')
package() {
	install -Dm755 "dufs" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
