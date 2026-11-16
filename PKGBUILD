pkgname=dcr-bin
pkgver=0.9.6
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
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.6/dcr-x86_64-unknown-linux-musl-0.9.6")
sha256sums_x86_64=('cdb7a5c74c2066eca0657c5eee3946af72bf22d7c10a68345c1fe6b0dcfc961e')
source_aarch64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.6/dcr-aarch64-unknown-linux-musl-0.9.6")
sha256sums_aarch64=('8c6bb8f61ae60c34162e4aeaf44b73516a4b0bed176af9bc4c9d1712815ccb4b')
source_i686=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.6/dcr-i686-unknown-linux-musl-0.9.6")
sha256sums_i686=('62f2de8f230c297fc8ce516473bbec521b03db48a90f2afdaafe6e6b1c3442a4')
source_armv7h=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.6/dcr-armv7-unknown-linux-musleabihf-0.9.6")
sha256sums_armv7h=('f4d8ae65522831b440b8c8376ef0a27c5ed84843a16e28ae3426134c71eeb37c')
source_riscv64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.6/dcr-riscv64gc-unknown-linux-musl-0.9.6")
sha256sums_riscv64=('a33f006ecfb3f2cc13fda536ec55674ed9b8eebe93f42c6ea639887af1ed295c')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
