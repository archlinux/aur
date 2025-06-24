# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=i3-auto-layout
pkgname="${_pkgname}-bin"
pkgver=0.4.2
pkgrel=1
pkgdesc="Automatic, optimal tiling for i3wm "
arch=('x86_64' 'aarch64')
url="https://github.com/pando85/i3-auto-layout"
license=('GPL')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/pando85/i3-auto-layout/releases/download/v${pkgver}/i3-auto-layout-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('acc915b9feb2fbc310c743146e366214be595f3ea9a6c511fa352799e2d1ba92')

package() {
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
