pkgname=dcr-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="Cargo-like utility to manage C/C++ projects (pre-compiled musl binary)"
arch=('x86_64' 'aarch64' 'i686' 'armv7h' 'riscv64')
url="https://github.com/dexoron/dcr"
license=('GPL-3.0-or-later')
provides=('dcr')
conflicts=('dcr')
optdepends=(
  'gcc: build C/C++ projects with GCC'
  'clang: build C/C++ projects with Clang'
)
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.4/dcr-x86_64-unknown-linux-musl-0.7.4")
sha256sums_x86_64=('5b842f2c6e61a97f581d9e0e0aa2a3ce78640b53e5cc32ad17b84298b0f09aa5')
source_aarch64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.4/dcr-aarch64-unknown-linux-musl-0.7.4")
sha256sums_aarch64=('986d6b4008bf5cebb4b31ea3398d4c38cd8f41c4b6c968c354beecf98bb21c4e')
source_i686=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.4/dcr-i686-unknown-linux-musl-0.7.4")
sha256sums_i686=('74db8b057e030987ae6ac2854e4feda6430c1e3e0bd43235bbfc4de00b1cdf7e')
source_armv7h=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.4/dcr-armv7-unknown-linux-musleabihf-0.7.4")
sha256sums_armv7h=('5a54e4e16cbd9aed0abda627489f90e9a3f22c4b3e68193e5e1654772a722a52')
source_riscv64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.4/dcr-riscv64gc-unknown-linux-musl-0.7.4")
sha256sums_riscv64=('fd5aa2c8c6a0074d9ea46a1a5ae175128bba7269945f08837f2b292518a8e6ac')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
