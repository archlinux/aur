# Maintainer: ZXY595 <3303057136@qq.com>
_pkgname=vtcode
pkgname=$_pkgname-bin
pkgver=0.133.2
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
sha256sums=('10390747f5c82e143d158258427ad1b2830063a3e88cd6ba2a71ca1f909bb27e')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
