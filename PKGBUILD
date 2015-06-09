pkgname=bsfilter
pkgrel=1
pkgver=1.0.19
pkgdesc="Spam filter that supports Japanese"
url=http://sourceforge.jp/projects/bsfilter/
arch=('any')
license=('GPL2')
source=("http://jaist.dl.sourceforge.jp/bsfilter/59804/$pkgname-$pkgver.tgz")
depends=('ruby')
md5sums=('6a9c5b9e553560908af30f038f80cfbe')

package() {
  install -Dm755 $srcdir/$pkgname-$pkgver/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}
