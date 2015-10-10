# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=svtplay-dl
pkgver=0.20.2015.10.08
pkgrel=1
pkgdesc="Small command-line program to download videos from svtplay.se/tv4play.se/tv3play.se/tv8play.se/tv6play.se/viaplay.se/aftonbladet"
url="https://github.com/spaam/svtplay-dl"
license=('MIT')
arch=('any')
depends=('rtmpdump' 'python-crypto' 'python-requests')
makedepends=('python-setuptools')
source=(https://github.com/spaam/svtplay-dl/archive/$pkgver.tar.gz)
md5sums=('8b3ac973b10588530fd6c1c21535424f')

package() {

  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root "$pkgdir"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
