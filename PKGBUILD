# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Co-maintainer: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill
pkgver=0.3.6
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="http://www.lihaoyi.com/mill/index.html"
license=('MIT')
depends=('bash' 'java-environment')

source=("$pkgname-$pkgver::https://github.com/lihaoyi/mill/releases/download/$pkgver/$pkgver"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/lihaoyi/mill/$pkgver/LICENSE")

md5sums=('5c65859b12a25e88b1abf6d03a6fb528'
         '08a3c7271d440a2388964b1d9289507a')

package() {
  install -Dm755 "$srcdir"/$pkgname-$pkgver "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir"/$pkgname-LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
