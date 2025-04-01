# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=i3-auto-layout
pkgname="${_pkgname}-bin"
pkgver=0.3.13
pkgrel=1
pkgdesc="Automatic, optimal tiling for i3wm "
arch=('x86_64' 'aarch64')
url="https://github.com/pando85/i3-auto-layout"
license=('GPL')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/pando85/i3-auto-layout/releases/download/v${pkgver}/i3-auto-layout-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('fd622cd7c4f12c9bb12fc24a70e243e217e9f5337ff0529db273fc9b7804394f')

package() {
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
