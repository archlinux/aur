# Maintainer: hinto.janai <hinto.janai@protonmail.com>
pkgname=festival-web-bin
pkgver=0.0.0
pkgrel=2
pkgdesc="Festival music player (Web)"
arch=('x86_64')
url="https://github.com/hinto-janai/festival"
license=('custom')
source=("${url}/releases/download/v${pkgver}/festival-web-v${pkgver}-linux-x64.tar.gz")
sha256sums=('882a81121f9ebbf4edb7663fa3814c7e37fe73cc504f554832312aab98d363c4')
validpgpkeys=('31C5145AAFA5A8DF1C1DB2A6D47CE05FA175A499')

package() {
	# Binary
	install -Dm755 "${srcdir}/festival-web-v${pkgver}-linux-x64/festival-web" "${pkgdir}/usr/bin/festival-web"
}
