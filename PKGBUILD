# Maintainer: hinto.janai <hinto.janai@protonmail.com>
pkgname=festival-cli-bin
pkgver=0.0.0
pkgrel=1
pkgdesc="Festival music player CLI"
arch=('x86_64')
url="https://github.com/hinto-janai/festival"
license=('custom')
source=("${url}/releases/download/v${pkgver}/festival-cli-v${pkgver}-linux-x64.tar.gz")
sha256sums=('6975dcfba3f62c8c39e3006735cbf2501f537c9840593fc96ef4013dd0f6b4da')
validpgpkeys=('31C5145AAFA5A8DF1C1DB2A6D47CE05FA175A499')

package() {
	# Binary
	install -Dm755 "${srcdir}/festival-cli" "${pkgdir}/usr/bin/festival-cli"
}
