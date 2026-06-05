# Maintainer: ZXY595 <3303057136@qq.com>
_pkgname=vtcode
pkgname=$_pkgname-bin
pkgver=0.123.0
pkgrel=1
pkgdesc="An open-source coding agent with LLM-native code understanding and robust shell safety."
arch=('x86_64')
url="https://github.com/vinhnx/VTCode"
license=('MIT')
depends=()
optdepends=("ast-grep")
conflicts=("$_pkgname")
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-$arch-unknown-linux-gnu.tar.gz")
sha256sums=('fabe015d16432bb065254ba986f514e44418420e1ca4ee2812873ec3d1886ce7')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
