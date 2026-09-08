# Maintainer: ZXY595 <zxy_595@qq.com>
_pkgname=vtcode
pkgname=$_pkgname-bin
pkgver=0.159.0
pkgrel=1
pkgdesc="An open-source Rust terminal coding agent for interactive and long-running autonomous work."
arch=('x86_64')
url="https://github.com/vinhnx/VTCode"
license=('MIT')
depends=()
optdepends=(
	"ast-grep: for search runtime"
	"ghostty: for richer PTY snapshots"
)
conflicts=("$_pkgname")
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-$arch-unknown-linux-gnu.tar.gz")
sha256sums=('caf119f7fe2a1ff94a8aa1300a1ecdf8771209c955d99ffbbbb6b340421d87c6')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
