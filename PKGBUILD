pkgname=dcr-bin
pkgver=0.7.1
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
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1/dcr-x86_64-unknown-linux-musl-0.7.1")
sha256sums_x86_64=('7d6db34afea3917cabf91311b0a875833af9a2dfd04a659caae15bb0d29dc71c')
source_aarch64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1/dcr-aarch64-unknown-linux-musl-0.7.1")
sha256sums_aarch64=('b59628c38161eaced943ab877de9a50980cc4b501c2dd74dece8e3ceb7191801')
source_i686=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1/dcr-i686-unknown-linux-musl-0.7.1")
sha256sums_i686=('5e20395d547ca61ec5a5209ff1fa85d5a1bd96336dd36699835f88856b91581a')
source_armv7h=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1/dcr-armv7-unknown-linux-musleabihf-0.7.1")
sha256sums_armv7h=('b53e337643b6938b8ffcd5b5422334682a5c8b4cc5abcf06bb18e890a346d959')
source_riscv64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1/dcr-riscv64gc-unknown-linux-musl-0.7.1")
sha256sums_riscv64=('c93b33f735c514874d67b6e13e6d12b638468266bdd415bdbca2cbb933ab60b6')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
