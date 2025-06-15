# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=timer-rs
pkgname="${_pkgname}-bin"
pkgver=0.8.10
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
sha256sums=('d917bc740b2029a872c77be62eb632865200f06059bb564f93ae626dcdce69f8')

package() {
	install -Dm755 timer "${pkgdir}/usr/bin/timer"
}
