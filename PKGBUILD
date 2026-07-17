# Maintainer: Alex Alexander <alex.alexander@gmail.com>
pkgname=claude-spaces
pkgver=0.9.10
pkgrel=1
pkgdesc="tmux-based session picker for Claude Code"
arch=('any')
url="https://github.com/wired/claude-spaces"
license=('MIT')
depends=('bash' 'tmux' 'jq')
optdepends=('claude-code: Claude Code CLI')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wired/claude-spaces/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e6e14537df5503884d33058c3f33a7e6d730c31e85acc8cc662503b731b57e33')

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX="$pkgdir/usr"
}
