# Maintainer: a77ila
pkgname=pactience-bin
pkgver=0.1.3
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
sha256sums_x86_64=('c44ac7cd3a770222b8bd26978b9ccc00a6a2de052fda0e9185067fba8c54bddb')
sha256sums_aarch64=('fe18856ad9c9861c04256ab43cf255d6402dba5bb2a1b68c92da31f0400e37bf')

package() {
  install -Dm755 pactience "$pkgdir/usr/bin/pactience"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
