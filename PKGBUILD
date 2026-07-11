# Maintainer: ZXY595 <zxy_595@qq.com>
_pkgname=vtcode
pkgname=$_pkgname-bin
pkgver=0.135.2
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
sha256sums=('4273f9cc3d9f530e71491c7c9ef01f099c9da203d9b2b5c1849a3403529346b2')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
