# Maintainer: swearchnick <swearchnick[at]gmail[dot]com>
pkgname=svtplay-dl
pkgver=0.20.2015.09.13
pkgrel=2
pkgdesc="Small command-line program to download videos from svtplay.se/tv4play.se/tv3play.se/tv8play.se/tv6play.se/viaplay.se/aftonbladet"
url="https://github.com/spaam/svtplay-dl"
license=('MIT')
arch=('any')
depends=('rtmpdump' 'python-crypto' 'python-requests')
makedepends=('python-setuptools')
source=(https://github.com/spaam/svtplay-dl/archive/$pkgver.tar.gz)
md5sums=('4c91067178db10a33353ec275002d1ab')

package() {

  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root "$pkgdir"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
