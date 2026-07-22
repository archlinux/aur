# Maintainer: a77ila
pkgname=pactience-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Enforce a minimum package age before upgrading Arch Linux packages (pacman/AUR) (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/a77ila/pactience"
license=('MIT' 'Apache-2.0')
depends=('pacman' 'gcc-libs' 'zlib')
optdepends=(
  'paru: AUR package support'
  'yay: AUR package support'
)
provides=('pactience')
conflicts=('pactience')
source_x86_64=("pactience-$pkgver-x86_64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/pactience-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("pactience-$pkgver-aarch64-unknown-linux-gnu.tar.gz::$url/releases/download/v$pkgver/pactience-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('32be33b6d077505a42e7b2aaaeb77f3e6a14f5cc26c365abe38e641023ec8a22')
sha256sums_aarch64=('82ed726a32e4853db76a75cbebeac81520cb69d7ecfc86764724ac2e0687b3b7')

package() {
  install -Dm755 pactience "$pkgdir/usr/bin/pactience"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
