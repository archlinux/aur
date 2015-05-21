pkgname=pymbtag
pkgver=0.1.6
pkgrel=3
pkgdesc="Tag various music files with data from musicbrainz.org"
arch=('any')
url="http://github.com/mineo/pymbtag"
license=('MIT')
depends=('python2' 'mutagen' 'python2-musicbrainz2')
source=("https://mortzu.de/files/aur/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('b4c489f859a15eafd7e903f46402cf57')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
