# Maintainer: ZXY595 <zxy_595@qq.com>
_pkgname=vtcode
pkgname=$_pkgname-bin
pkgver=0.134.14
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
sha256sums=('1435cef4f2bba2e835e5805dc0794b6034e47aafec58ecf566c86be2ba61d062')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
