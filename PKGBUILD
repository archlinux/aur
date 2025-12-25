# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=timer-rs
pkgname="${_pkgname}-bin"
pkgver=0.11.0
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
sha256sums=('91d5a40637c1340d3636e4421517f7c37cadc02b1d8950e3760c3937eb401a3e')

package() {
	install -Dm755 timer "${pkgdir}/usr/bin/timer"
}
