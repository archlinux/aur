# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mill
pkgver=0.2.0
pkgrel=1
pkgdesc="shiny new Scala build tool"
arch=(any)
url="http://www.lihaoyi.com/mill/index.html"
license=('custom')
depends=('bash' 'java-environment<9')

source=("$pkgname-$pkgver.sh::https://github.com/lihaoyi/mill/releases/download/$pkgver/$pkgver"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/lihaoyi/mill/$pkgver/LICENSE")

md5sums=('539a9f80922852fb9c65b969326f8236'
         'SKIP')

package() {
  install -Dm755 $srcdir/$pkgname-$pkgver.sh $pkgdir/usr/bin/$pkgname
  install -Dm644 $srcdir/$pkgname-LICENSE    $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
