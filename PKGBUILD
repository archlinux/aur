# Maintainer: Dylan Baker <dylan@pnwbakers.com>
pkgname=meson-cross-aarch64-linux-gnu
pkgver=3
pkgrel=1
pkgdesc="Meson cross file for aarch64"
arch=('any')
url="https://github.com/dcbaker/archlinux-meson-cross-aarch64-linux-gnu"
license=('APL2')
depends=('meson' 'aarch64-linux-gnu-binutils' 'aarch64-linux-gnu-gcc' 'aarch64-linux-gnu-glibc' 'aarch64-linux-gnu-pkg-config')
source=("https://github.com/dcbaker/archlinux-meson-cross-aarch64-linux-gnu/archive/v${pkgver}.tar.gz")
sha256sums=('2d3e29ce819698e36e35307ac9aa4409efb1286778d98282f434446e4820253f')

package() {
	cd "archlinux-$pkgname-$pkgver"
    echo $PWD
    install -Dm644 "aarch64-linux-gnu" "${pkgdir}/usr/share/meson/cross/aarch64-linux-gnu"
}
