pkgname=pymbtag
pkgver=0.1.6
pkgrel=3
pkgdesc="Tag various music files with data from musicbrainz.org"
arch=('any')
url="http://github.com/mineo/pymbtag"
license=('MIT')
depends=('python2' 'mutagen' 'python-musicbrainz2')
source=("https://mortzu.de/files/aur/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('540defe831fb5baa3ba9b6904f4955ac')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
