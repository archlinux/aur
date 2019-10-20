# Maintainer: Taylon Silva <taylonsilva@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-n
pkgver=6.0.1
pkgrel=1
pkgdesc="Node version manager"
arch=("any")
depends=("bash")
url="https://github.com/tj/n"
license=("MIT")
install="${pkgname}.install"
source=("https://github.com/tj/n/archive/v6.0.1.zip"
        "LICENSE.md")
md5sums=('3d32c74fb290600264cbe7ca54fa301b'
         '55761bbdb8c6dfe8c83a1f27122bdff1')

package() {
  cd "n-$pkgver"

  PREFIX="$pkgdir/usr" make install

  install -Dm644 "${srcdir}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
