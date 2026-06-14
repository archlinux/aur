# Maintainer: ZXY595 <3303057136@qq.com>
_pkgname=vtcode
pkgname=$_pkgname-bin
pkgver=0.128.4
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
sha256sums=('4780b44b91be15797aa0b1b0186e8f014485de8a8baaa9ee97aac3b6f8fd03cc')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
