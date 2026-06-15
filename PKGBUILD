pkgname=dcr-bin
pkgver=0.7.3
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
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.3/dcr-x86_64-unknown-linux-musl-0.7.3")
sha256sums_x86_64=('4bdaa28f327dae379c21c0b6e48f641b944bb35c8f45071536ca5fba38c963df')
source_aarch64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.3/dcr-aarch64-unknown-linux-musl-0.7.3")
sha256sums_aarch64=('21e69e1f43b71da115119c132f643e9be15be8f5680959cf7de8f2b499aa8588')
source_i686=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.3/dcr-i686-unknown-linux-musl-0.7.3")
sha256sums_i686=('c37d9a2cefb88820e9cbfea9f5c7ac5c4b5bd097cd7da8c34cf11a1a6cfbb12d')
source_armv7h=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.3/dcr-armv7-unknown-linux-musleabihf-0.7.3")
sha256sums_armv7h=('4fec2973f4524764035e2821391c0bbbe34241cc6e55e8452d6a4f8d4d8afaf0')
source_riscv64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.3/dcr-riscv64gc-unknown-linux-musl-0.7.3")
sha256sums_riscv64=('4f145576a76e90750cad8067bd2aae7c7933953a8b19f480b713a18f59d43d28')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
