# Maintainer: Daniele Basso <d dot bass05 at proton dot me>
pkgname=code-electron-latest
pkgver=0.0.0
pkgrel=1
pkgdesc="A bash wrapper forcing vscode using system electron"
arch=("any")
url=""
license=('GPL')
depends=(code)
source=("code-electron")
sha256sums=('56ed69efdf48f178f98b4fe6052a5953e9905790cd36322792ea7252fe43aece')

package() {
	install -Dm755 code-electron "${pkgdir}/usr/bin/code-electron"
}
