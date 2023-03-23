# Maintainer: hinto.janai <hinto.janai@protonmail.com>
pkgname=festival-gui-bin
pkgver=0.0.0
pkgrel=2
pkgdesc="Festival music player GUI"
arch=('x86_64')
url="https://github.com/hinto-janai/festival"
license=('custom')
source=("${url}/releases/download/v${pkgver}/festival-gui-v${pkgver}-linux-x64.tar.gz")
sha256sums=('ba36dbf1e2fb3a1e8f8c31cce73a0b41efe3021020250de4f66348050176f450')
validpgpkeys=('31C5145AAFA5A8DF1C1DB2A6D47CE05FA175A499')

package() {
	# Binary
	install -Dm755 "${srcdir}/festival" "${pkgdir}/usr/bin/festival"

	# Icon
	install -Dm644 "${srcdir}/festival.png" "${pkgdir}/usr/share/pixmaps/festival.png"

	# `.desktop` file.
	install -Dm644 "${srcdir}/festival.desktop" "${pkgdir}/usr/share/applications/festival.desktop"
}
