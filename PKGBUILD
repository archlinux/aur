# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=timer-rs
pkgname="${_pkgname}-bin"
pkgver=0.11.4
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
sha256sums=('020792f2bf7ec8c1756d15064458ccf20bf0783c812223ab88b6c5cdb95e0622')

package() {
	install -Dm755 timer "${pkgdir}/usr/bin/timer"
}
