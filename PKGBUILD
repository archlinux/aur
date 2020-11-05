# Maintainer: pumpkincheshire <sollyonzou@gmail.com>
# Contributor:  <tigersoldi at gmail dot com>
pkgname=google-java-format
pkgver=1.9
pkgrel=1
pkgdesc="Reformats Java source code to comply with Google Java Style"
arch=('any')
url="https://github.com/google/google-java-format"
license=('Apache')
depends=('java-runtime')
options=()
source=(https://github.com/google/google-java-format/releases/download/$pkgname-$pkgver/$pkgname-$pkgver-all-deps.jar
        google-java-format)
sha256sums=('1d98720a5984de85a822aa32a378eeacd4d17480d31cba6e730caae313466b97'
            'c74d344403aa33281871c80fec01a0ac0e2413b88058bae780c3ae9c25d4be77')


package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-all-deps.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755  "$srcdir/google-java-format" "$pkgdir/usr/bin/google-java-format"
}
