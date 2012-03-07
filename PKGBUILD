# Maintainer: Johannes Dewender   arch at JonnyJD dot net
pkgname=isrcsubmit
pkgver=0.4
pkgrel=2
pkgdesc="submit ISRCs from disc to MusicBrainz"
arch=('any')
url="https://github.com/JonnyJD/musicbrainz-isrcsubmit"
license=('GPL3')
depends=('python2' 'python-musicbrainz2>=0.7.0')
makedepends=()
conflicts=()
options=(!emptydirs)
source=(http://github.com/downloads/JonnyJD/musicbrainz-isrcsubmit/isrcsubmit-0.4.tar.gz)
md5sums=('f24ccfa09b18eaef2819f83ae0f6fee6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
