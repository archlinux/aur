# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=i3-auto-layout
pkgname="${_pkgname}-bin"
pkgver=0.3.16
pkgrel=1
pkgdesc="Automatic, optimal tiling for i3wm "
arch=('x86_64' 'aarch64')
url="https://github.com/pando85/i3-auto-layout"
license=('GPL')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/pando85/i3-auto-layout/releases/download/v${pkgver}/i3-auto-layout-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('0d689e8efa2e22983f9fb56ffcff8a8628faba92a40f8bc21fb3bc20a12f15e2')

package() {
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
