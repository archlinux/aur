# Maintainer: ZXY595 <zxy_595@qq.com>
_pkgname=vtcode
pkgname=$_pkgname-bin
pkgver=0.169.5
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
sha256sums=('f60e85ba2d9babbf2ef89f19c68bd7c21081d33cc58a23c74d21ae5708b5c057')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
