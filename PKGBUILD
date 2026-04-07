# Maintainer: Alex Alexander <alex.alexander@gmail.com>
pkgname=claude-spaces
pkgver=0.9.8
pkgrel=1
pkgdesc="tmux-based session picker for Claude Code"
arch=('any')
url="https://github.com/wired/claude-spaces"
license=('MIT')
depends=('bash' 'tmux' 'jq')
optdepends=('claude-code: Claude Code CLI')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wired/claude-spaces/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c0b8b9f1a467c26e973e0eb699e9e9094f7d4f911fe881cc9e76f18764ffbd49')

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX="$pkgdir/usr"
}
