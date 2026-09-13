pkgname=dcr-bin
pkgver=0.9.1
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
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.1/dcr-x86_64-unknown-linux-musl-0.9.1")
sha256sums_x86_64=('badb2844023bd84e3193d1e037c776872afc6137724cf0abfc884f1b672068ab')
source_aarch64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.1/dcr-aarch64-unknown-linux-musl-0.9.1")
sha256sums_aarch64=('eaead8c448a36a433b1df1a27266d3457a03b7ca90c34812e04879bc9f798fb3')
source_i686=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.1/dcr-i686-unknown-linux-musl-0.9.1")
sha256sums_i686=('a967dba07d07c369ab6a5946b06694f857fade0c1ec1eae487d18df5db7c7106')
source_armv7h=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.1/dcr-armv7-unknown-linux-musleabihf-0.9.1")
sha256sums_armv7h=('b6c845c416a408278ff808258e56bf8530c9aa77ba87bee7e0c54958e77abf6d')
source_riscv64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.9.1/dcr-riscv64gc-unknown-linux-musl-0.9.1")
sha256sums_riscv64=('30d4c862a3aefa9bd2577132575d9676560c062b6d51e895555001eaaa73a78f')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
