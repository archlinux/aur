# Maintainer: hinto.janai <hinto.janai@protonmail.com>
pkgname=festivald-bin
pkgver=0.0.0
pkgrel=2
pkgdesc="Festival music player daemon"
arch=('x86_64')
url="https://github.com/hinto-janai/festival"
license=('custom')
source=("${url}/releases/download/v${pkgver}/festivald-v${pkgver}-linux-x64.tar.gz")
sha256sums=('458cc24d9f9161948274bfe93eb002d66891310d69d4bebd1716960ea4485aab')
validpgpkeys=('31C5145AAFA5A8DF1C1DB2A6D47CE05FA175A499')

package() {
	# Binary
	install -Dm755 "${srcdir}/festivald-v${pkgver}-linux-x64/festivald" "${pkgdir}/usr/bin/festivald"
}
