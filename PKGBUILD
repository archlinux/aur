# Maintainer: ZXY595 <3303057136@qq.com>
_pkgname=vtcode
pkgname=$_pkgname-bin
pkgver=0.125.3
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
sha256sums=('25337b61c18178e610dacb925de9b9af97eee8d3d0f4eee4290187f1d31a1626')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
