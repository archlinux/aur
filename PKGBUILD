pkgname=battls
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple CLI utility that lists your battery information"
arch=($CARCH)
url="https://github.com/dantehemerson/battls"
# Maintainer: Dante Calderon <youremail@example.com>
license=('GPL3')
depends=()
conflicts=('battls-git')

source=(
  "https://github.com/dantehemerson/battls/releases/download/v$pkgver/$pkgname-$CARCH-unknown-linux-musl.tar.xz"
)

sha256sums=('815d48c25caba47a2e873b9cfa1cdbdbf7919af4632c4bba1d792ee3b1fe8089')

package() {
  install -Dm755 "$srcdir/battls-$CARCH-unknown-linux-musl/battls" "$pkgdir/usr/bin/battls"
}
