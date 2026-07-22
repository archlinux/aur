# Maintainer: a77ila
pkgname=pactience-bin
pkgver=0.1.1
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
sha256sums_x86_64=('dd6ea35f0a2863450d3539d028d7fc87d71717291176da5ce0e43eb785c65a5f')
sha256sums_aarch64=('18c732a94903b4006c6dae11f6794244a8c5fc38675849865230ba40d56fa240')

package() {
  install -Dm755 pactience "$pkgdir/usr/bin/pactience"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
