# vim:set ts=2 sw=2 et:
# Maintainer: Score_Under <seejay.11@gmail.com>
# Contributor: OK100 <ok100.ok100.ok100@gmail.com>

pkgname=hsaudiotag
pkgver=1.1.1
pkgrel=2
pkgdesc="Read metadata (tags) of mp3, mp4, wma, ogg, flac and aiff files (python2 version)"
url="http://pypi.python.org/pypi/hsaudiotag"
arch=(any)
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/h/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('751a554bd22c8c588bf25dd7ef00b9ac')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
}
