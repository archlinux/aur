# Maintainer: a77ila
pkgname=pactience-bin
pkgver=0.2.3
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
sha256sums_x86_64=('c24dbef702df955b882fa5d564585cfd28c99d1f773bfd44b3001213ce76bb77')
sha256sums_aarch64=('aa99e2ab68a19f4806102f9fbe155f48510e5b140a932ec26be808538f1764df')

package() {
  install -Dm755 pactience "$pkgdir/usr/bin/pactience"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
