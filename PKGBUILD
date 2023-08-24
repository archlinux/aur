# Maintainer: hinto.janai <hinto.janai@protonmail.com>
pkgname=festival-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Festival music player CLI"
arch=('x86_64')
url="https://github.com/hinto-janai/festival"
license=('MIT')
source=("${url}/releases/download/cli-v${pkgver}/festival-cli-v${pkgver}-linux-x64.tar.gz")
sha256sums=('2d9517b57ebb2d91c1105faf319eb73b001e013132f8aa768e4777b899f9a70d')
validpgpkeys=('31C5145AAFA5A8DF1C1DB2A6D47CE05FA175A499')

package() {
	cd "$srcdir"

	# Binary
	install -Dm755 festival-cli "${pkgdir}/usr/bin/festival-cli"
}
