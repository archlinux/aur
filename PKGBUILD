# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=timer-rs
pkgname="${_pkgname}-bin"
pkgver=0.10.0
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
sha256sums=('05d1af1620427b83291bdc559b937286de3c4902b06dc227232443c230aee921')

package() {
	install -Dm755 timer "${pkgdir}/usr/bin/timer"
}
