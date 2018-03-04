# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mill
pkgver=0.1.4
pkgrel=2
pkgdesc="shiny new Scala build tool"
arch=(any)
url="http://www.lihaoyi.com/mill/index.html"
license=('custom')
depends=('bash' 'java-environment<9')

source=("$pkgname-$pkgver.sh::https://github.com/lihaoyi/mill/releases/download/$pkgver/$pkgver"
        "$pkgname-LICENSE::https://github.com/lihaoyi/mill/blob/$pkgver/LICENSE")

md5sums=('482b18877abf7f384f11a719f9957d4f'
         '80863d861ff68efa0d3ece5cafe295e4')

package() {
  install -Dm755 $srcdir/$pkgname-$pkgver.sh $pkgdir/usr/bin/$pkgname
  install -Dm644 $srcdir/$pkgname-LICENSE    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
