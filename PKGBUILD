# Maintainer: Taylon Silva <taylonsilva@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-n
pkgver=2.1.11
pkgrel=2
pkgdesc="Node version manager"
arch=("any")
depends=("bash")
url="https://github.com/tj/n"
license=("MIT")
install="${pkgname}.install"
source=("https://github.com/tj/n/archive/v2.1.11.zip"
        "LICENSE.md")
md5sums=('4c1274a88532e94cd4aa312fc6c50636'
         '55761bbdb8c6dfe8c83a1f27122bdff1')

package() {
  cd "n-$pkgver"

  PREFIX="$pkgdir/usr" make install

  install -Dm644 "${srcdir}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
