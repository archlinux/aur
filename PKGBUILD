# Maintainer: Alex Alexander <alex.alexander@gmail.com>
pkgname=claude-spaces
pkgver=0.9.11
pkgrel=1
pkgdesc="tmux-based session picker for Claude Code"
arch=('any')
url="https://github.com/wired/claude-spaces"
license=('MIT')
depends=('bash' 'tmux' 'jq')
optdepends=('claude-code: Claude Code CLI')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wired/claude-spaces/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b8eea866381bd5426dff7a2045db07140588d345d693cac62292e6e490d3ba4')

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX="$pkgdir/usr"
}
