# Maintainer: ZXY595 <zxy_595@qq.com>
_pkgname=vtcode
pkgname=$_pkgname-bin
pkgver=0.140.1
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
sha256sums=('6cb9682a838a596e678de349d725783716d49c86d72819559d4cc83b0cc2e9d7')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
