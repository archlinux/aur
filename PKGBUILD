# Maintainer:  <tigersoldi at gmail dot com>
pkgname=google-java-format
pkgver=1.7
pkgrel=1
pkgdesc="Reformats Java source code to comply with Google Java Style"
arch=('any')
url="https://github.com/google/google-java-format"
license=('Apache')
depends=('java-runtime')
options=()
source=(https://github.com/google/google-java-format/releases/download/$pkgname-$pkgver/$pkgname-$pkgver-all-deps.jar
        google-java-format)
md5sums=('d8ef209ab1f4b603089f3fa52c3a03ba'
         'e5b04729b788ccd83df24eaee98a35e6')

package() {
  mkdir -p "$pkgdir/usr/share/java/$pkgname/"
  cp "$srcdir/$pkgname-$pkgver-all-deps.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"

  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/google-java-format" "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
