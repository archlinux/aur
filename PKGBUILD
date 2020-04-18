# Maintainer: Taylon Silva <taylonsilva@gmail.com>

pkgname=reason-language-server
pkgver=1.7.8
pkgrel=1
pkgdesc="A language server for reason, in reason"
arch=("x86_64")
url="https://github.com/jaredly/reason-language-server"
depends=("glibc")
license=("MIT")
source=("https://github.com/jaredly/reason-language-server/releases/download/$pkgver/rls-linux.zip"
        "LICENSE.md")
md5sums=('6000a649b5baa07dab9b7eb7eeffce51'
         '53b2980d07d569c6711b8455108a99cd')

package() {
  install -Dm755 "$srcdir/rls-linux/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
