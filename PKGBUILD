pkgname=dcr-bin
pkgver=0.8.2
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
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.2/dcr-x86_64-unknown-linux-musl-0.8.2")
sha256sums_x86_64=('d29f1795c4a1e0633fd1515c3d9b15abaf5fd9a8472a6002205e40a8d4c39084')
source_aarch64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.2/dcr-aarch64-unknown-linux-musl-0.8.2")
sha256sums_aarch64=('1f8aa66f379779350ddcadcbaf6c4aa66f2b46696e4314a1981d2cabd9fb6674')
source_i686=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.2/dcr-i686-unknown-linux-musl-0.8.2")
sha256sums_i686=('955636c615a341778b1b42f75f2bba617429d3b048694d766a02d15f93859048')
source_armv7h=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.2/dcr-armv7-unknown-linux-musleabihf-0.8.2")
sha256sums_armv7h=('91ffe3aa0ecab9d52b4c699b9b0a71bbc24c0c57e770454a42e7a1b9109c2456')
source_riscv64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.2/dcr-riscv64gc-unknown-linux-musl-0.8.2")
sha256sums_riscv64=('452ba1614d9d1a974183314c39023b5c25c80a91558454c195b216cd55df37e1')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
