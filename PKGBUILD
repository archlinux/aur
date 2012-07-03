# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=isrcsubmit
pkgver=0.4.1
pkgrel=1
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="https://github.com/JonnyJD/musicbrainz-isrcsubmit"
license=('GPL3')
depends=('python2' 'python-musicbrainz2>=0.7.0')
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://github.com/downloads/JonnyJD/musicbrainz-isrcsubmit/isrcsubmit-$pkgver.tar.gz)
md5sums=('d3c310343ae80610f904ebdd0e73999a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
