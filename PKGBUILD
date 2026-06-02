pkgname=dcr-dev-bin
pkgver=0.7.1
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
source_x86_64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1-dev/dcr-x86_64-unknown-linux-musl-0.7.1-dev")
sha256sums_x86_64=('78eb3ee7a771e965cd21e62135ab3ef7570f90b4d1efb1a7d2f9649012da864b')
source_aarch64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1-dev/dcr-aarch64-unknown-linux-musl-0.7.1-dev")
sha256sums_aarch64=('1db47d9475252ed4b00dce2e91b2d886631898d494f07a712cff24ffd0786db7')
source_i686=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1-dev/dcr-i686-unknown-linux-musl-0.7.1-dev")
sha256sums_i686=('fbad3e2b80a9333a5b2c9401a1be9b8d14fee9148c884af7e0d9ff5c803c1a3a')
source_armv7h=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1-dev/dcr-armv7-unknown-linux-musleabihf-0.7.1-dev")
sha256sums_armv7h=('310b32154f3a8cf2cc3d12655d2ccd602cbcc6cf14cf40a043cfcdef4928ca08')
source_riscv64=("dcr-$pkgver::https://github.com/dexoron/dcr/releases/download/v0.7.1-dev/dcr-riscv64gc-unknown-linux-musl-0.7.1-dev")
sha256sums_riscv64=('ad15968e5a8202a8ce347dd863e1507d1aebefd48a89f8e86bfdd069137688d5')

package() {
  install -Dm755 "$srcdir/dcr-$pkgver" "$pkgdir/usr/bin/dcr"
}
