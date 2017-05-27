# Maintainer: Taylon Silva <taylonsilva@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-n
pkgver=2.1.7
pkgrel=1
pkgdesc="Node version manager"
arch=("any")
depends=("bash")
url="https://github.com/tj/n"
license=("MIT")
install="${pkgname}.install"
source=("https://github.com/tj/n/archive/ccc1d6ffb3138091a39cd48d51f5c04c73d580e8.zip"
        "LICENSE.md")
md5sums=("1332b2bd5f3218f9bfbb353b9d7d8a0d"
         "55761bbdb8c6dfe8c83a1f27122bdff1")

package() {
  cd "n-ccc1d6ffb3138091a39cd48d51f5c04c73d580e8"

  PREFIX="$pkgdir/usr" make install

  install -Dm644 "${srcdir}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
