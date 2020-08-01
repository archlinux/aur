# Maintainer: Taylon Silva <taylonsilva@gmail.com>

pkgname=reason-language-server
pkgver=1.7.10
pkgrel=1
pkgdesc="A language server for reason, in reason"
arch=("x86_64")
url="https://github.com/jaredly/reason-language-server"
depends=("glibc")
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/jaredly/reason-language-server/releases/download/$pkgver/rls-linux.zip"
        "LICENSE.md")
md5sums=('561e351168c0fa0123a234a4dbe545a2'
         '53b2980d07d569c6711b8455108a99cd')

package() {
  install -Dm755 "$srcdir/rls-linux/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
