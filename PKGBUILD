# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=timer-rs
pkgname="${_pkgname}-bin"
pkgver=0.11.1
pkgrel=1
pkgdesc="Timer application"
arch=('x86_64' 'aarch64')
url="https://github.com/pando85/timer"
license=('GPL')
depends=('gcc-libs'
         'alsa-lib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/pando85/timer/releases/download/v${pkgver}/timer-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('57d9860c874623df7fcb0e83b37e0053a0f94dc8b97f56df1bec128e419e4eb4')

package() {
	install -Dm755 timer "${pkgdir}/usr/bin/timer"
}
