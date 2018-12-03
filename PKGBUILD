# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=mill
pkgver=0.3.5
pkgrel=1
pkgdesc="shiny new Scala build tool"
arch=(any)
url="http://www.lihaoyi.com/mill/index.html"
license=('MIT')
depends=('bash' 'java-environment<9')

source=("$pkgname-$pkgver.sh::https://github.com/lihaoyi/mill/releases/download/$pkgver/$pkgver"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/lihaoyi/mill/$pkgver/LICENSE")

md5sums=('5ebf7a9aeed62e089c8dc8c506ffbee8'
         '08a3c7271d440a2388964b1d9289507a')

package() {
  # shellcheck disable=2154
  install -Dm755 "$srcdir"/$pkgname-$pkgver.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir"/$pkgname-LICENSE    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
