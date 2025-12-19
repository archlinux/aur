# Maintainer: Sid Pranjale <sidpranjale127@protonmail.com>
# Maintainer: Dylan Baker <dylan@pnwbakers.com>
pkgname=meson-cross-aarch64-linux-gnu
pkgver=5
pkgrel=2
pkgdesc="Meson cross file for aarch64"
arch=('any')
url="https://github.com/dcbaker/archlinux-meson-cross-aarch64-linux-gnu"
license=('APL2')
depends=('meson' 'aarch64-linux-gnu-binutils' 'aarch64-linux-gnu-gcc' 'aarch64-linux-gnu-glibc' 'aarch64-linux-gnu-pkg-config')
source=("https://github.com/dcbaker/archlinux-meson-cross-aarch64-linux-gnu/archive/v${pkgver}.tar.gz")
sha256sums=('bc90a3325ffd6b22fe7c2dabc0f3adf6fa9f0665f3f057d92ceec3139c8d3de9')

package() {
	cd "archlinux-$pkgname-$pkgver"
    install -Dm644 "aarch64-linux-gnu" "${pkgdir}/usr/share/meson/cross/aarch64-linux-gnu"
}
