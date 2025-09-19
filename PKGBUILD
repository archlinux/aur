# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=i3-auto-layout
pkgname="${_pkgname}-bin"
pkgver=0.4.3
pkgrel=1
pkgdesc="Automatic, optimal tiling for i3wm "
arch=('x86_64' 'aarch64')
url="https://github.com/pando85/i3-auto-layout"
license=('GPL')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/pando85/i3-auto-layout/releases/download/v${pkgver}/i3-auto-layout-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('09455f34fc53684c11297f049c2f557c90a10f53e3828a931fb7e0377b6c6e66')

package() {
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
