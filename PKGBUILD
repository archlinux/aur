# Maintainer: Dylan Baker <dylan@pnwbakers.com>
pkgname=meson-cross-aarch64-linux-gnu
pkgver=2
pkgrel=2
pkgdesc="Meson cross file for aarch64"
arch=('any')
url="https://github.com/dcbaker/archlinux-meson-cross-aarch64-linux-gnu"
license=('APL2')
depends=('meson' 'aarch64-linux-gnu-binutils' 'aarch64-linux-gnu-gcc' 'aarch64-linux-gnu-glibc' 'aarch64-linux-gnu-pkg-config')
source=("https://github.com/dcbaker/archlinux-meson-cross-aarch64-linux-gnu/archive/v${pkgver}.tar.gz")
sha256sums=('b22446cdde4fcd7e52953ff1ef8303164efc3fb48486eed46b764eb57ed65d4d')

package() {
	cd "archlinux-$pkgname-$pkgver"
    echo $PWD
    install -Dm644 "aarch64-linux-gnu" "${pkgdir}/usr/share/meson/cross/aarch64-linux-gnu"
}
