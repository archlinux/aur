pkgname=dcr-bin
pkgver=0.8.1
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
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.1/dcr-x86_64-unknown-linux-musl-0.8.1")
sha256sums_x86_64=('256ead1b0e571bf549c7d888b29356de63e7b0a86749d0dc4bffb5b3b91a1308')
source_aarch64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.1/dcr-aarch64-unknown-linux-musl-0.8.1")
sha256sums_aarch64=('36f295788cc053b94540921668c21357c9176acb039b4452cfbfe4aec057642a')
source_i686=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.1/dcr-i686-unknown-linux-musl-0.8.1")
sha256sums_i686=('0a67aaa31469df2a0b36a6ad6f029b6f285fab64985cd5a7f3ce3599177d74e4')
source_armv7h=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.1/dcr-armv7-unknown-linux-musleabihf-0.8.1")
sha256sums_armv7h=('2b9c8098aea79e305757f2523065e0beb0df0d8ac3d1c72c3568768de9b330c0')
source_riscv64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.8.1/dcr-riscv64gc-unknown-linux-musl-0.8.1")
sha256sums_riscv64=('9addd58bee71d988612b2681ddf4bad4b7871755f9411a0b5cc911ded475e785')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
