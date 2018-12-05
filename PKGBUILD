# Maintainer: Dylan Baker <dylan@pnwbakers.com>
pkgname=meson-cross-aarch64-linux-gnu
pkgver=4
pkgrel=1
pkgdesc="Meson cross file for aarch64"
arch=('any')
url="https://github.com/dcbaker/archlinux-meson-cross-aarch64-linux-gnu"
license=('APL2')
depends=('meson' 'aarch64-linux-gnu-binutils' 'aarch64-linux-gnu-gcc' 'aarch64-linux-gnu-glibc' 'aarch64-linux-gnu-pkg-config')
source=("https://github.com/dcbaker/archlinux-meson-cross-aarch64-linux-gnu/archive/v${pkgver}.tar.gz")
sha256sums=('d0243568cb5562dc395be128230de0c989685bee3bdaa062124129ddbe2ef927')

package() {
	cd "archlinux-$pkgname-$pkgver"
    echo $PWD
    install -Dm644 "aarch64-linux-gnu" "${pkgdir}/usr/share/meson/cross/aarch64-linux-gnu"
}
