# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Dylan Baker <dylan@pnwbakers.com>

pkgname=meson-cross-riscv64-linux-gnu
pkgver=1
pkgrel=1
pkgdesc="Meson cross file for riscv64"
arch=('any')
url="https://github.com/1ace/archlinux-meson-cross-riscv64-linux-gnu"
license=('MIT')
depends=('meson' 'riscv64-linux-gnu-binutils' 'riscv64-linux-gnu-gcc' 'riscv64-linux-gnu-glibc' 'riscv64-linux-gnu-pkg-config')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('041afe4ccebeeee1c37d77152c01a71ec062f64121813c90efcab4b2bf224180')

package() {
  cd "archlinux-$pkgname-$pkgver"
  install -Dm644 "riscv64-linux-gnu" "${pkgdir}/usr/share/meson/cross/riscv64-linux-gnu"
}
