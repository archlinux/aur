pkgname=dcr-dev-bin
pkgver=0.7.3
pkgrel=1
pkgdesc="Cargo-like utility to manage C/C++ projects (pre-compiled musl binary dev release)"
arch=('x86_64' 'aarch64' 'i686' 'armv7h' 'riscv64')
url="https://github.com/dexoron/dcr"
license=('GPL-3.0-or-later')
provides=('dcr')
conflicts=('dcr')
optdepends=(
  'gcc: build C/C++ projects with GCC'
  'clang: build C/C++ projects with Clang'
)
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.3-dev/dcr-x86_64-unknown-linux-musl-0.7.3-dev")
sha256sums_x86_64=('aa2627df1ae1747aa0c215497bacff1850cbadf81cb1789177f1db77cf97cff4')
source_aarch64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.3-dev/dcr-aarch64-unknown-linux-musl-0.7.3-dev")
sha256sums_aarch64=('2cef8470a8d0d97442c620bfe39ae40ba69705e508e92c8aadcbbfc876fbc8e2')
source_i686=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.3-dev/dcr-i686-unknown-linux-musl-0.7.3-dev")
sha256sums_i686=('da4b03473edb3bb5f2291c836370440b9c70b2a480a18101deecb047112c2b75')
source_armv7h=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.3-dev/dcr-armv7-unknown-linux-musleabihf-0.7.3-dev")
sha256sums_armv7h=('939fa2e924cdb0a86a11a0fb428ade73a55382e4b29d49cabfa268648b4f45f6')
source_riscv64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.3-dev/dcr-riscv64gc-unknown-linux-musl-0.7.3-dev")
sha256sums_riscv64=('225a71ab27e042ba8bfd3a02caca676b4714d11d5c2da700eff8255779c63542')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
