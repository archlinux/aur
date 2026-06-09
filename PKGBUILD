# Maintainer: ZXY595 <3303057136@qq.com>
_pkgname=vtcode
pkgname=$_pkgname-bin
pkgver=0.123.10
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
sha256sums=('0937f8cf09d77b41eb3a67e18487b34210dfedd3745a59cb4cd55fc21843c969')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
