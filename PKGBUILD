# Maintainer: Alex Alexander <alex.alexander@gmail.com>
pkgname=claude-spaces
pkgver=0.9.9
pkgrel=1
pkgdesc="tmux-based session picker for Claude Code"
arch=('any')
url="https://github.com/wired/claude-spaces"
license=('MIT')
depends=('bash' 'tmux' 'jq')
optdepends=('claude-code: Claude Code CLI')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wired/claude-spaces/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('690d2e711d7b07af82046b3d04dc220195986fb62539802f70aebeac2f6e448e')

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX="$pkgdir/usr"
}
