# Maintainer: ZXY595 <zxy_595@qq.com>
_pkgname=vtcode
pkgname=$_pkgname-bin
pkgver=0.134.3
pkgrel=1
pkgdesc="An open-source coding agent with LLM-native code understanding and robust shell safety."
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
sha256sums=('dd3fff8aa74f7dffe06eabbc8280000a516f873e8a177308f866df70f610f39e')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
