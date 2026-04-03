# Maintainer: Alex Alexander <alex.alexander@gmail.com>
pkgname=claude-spaces
pkgver=0.9.5
pkgrel=1
pkgdesc="tmux-based session picker for Claude Code"
arch=('any')
url="https://github.com/wired/claude-spaces"
license=('MIT')
depends=('bash' 'tmux' 'jq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wired/claude-spaces/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('732a7e6beae908a3c3d4743b9212d45fbc570169f34ddb6cb6a7fb6f53948bd2')

package() {
  cd "$pkgname-$pkgver"
  make install PREFIX="$pkgdir/usr"
}
