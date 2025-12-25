# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=i3-auto-layout
pkgname="${_pkgname}-bin"
pkgver=0.4.4
pkgrel=1
pkgdesc="Automatic, optimal tiling for i3wm "
arch=('x86_64' 'aarch64')
url="https://github.com/pando85/i3-auto-layout"
license=('GPL')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/pando85/i3-auto-layout/releases/download/v${pkgver}/i3-auto-layout-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('4267d0ac851e2373f0a282bf513ce422942cd2d62d01f6140ae5966018cc117f')

package() {
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
