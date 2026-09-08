# Maintainer: ZXY595 <zxy_595@qq.com>
_pkgname=vtcode
pkgname=$_pkgname-bin
pkgver=0.158.2
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
sha256sums=('f388df4c6bff434fa276e0046273ce7363d8b3c9c5df58fe6d059752f6e723b8')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
