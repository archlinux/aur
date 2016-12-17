# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=python2-pyspotify
_pkgname=pyspotify
pkgver=2.0.5
pkgrel=2
pkgdesc="A Python Spotify library"
arch=('any')
url="http://pyspotify.mopidy.com/"
license=('APACHE')
depends=('python2' 'libspotify' 'python2-cffi' 'python2-setuptools')
conflicts=('pyspotify-git' 'pyspotify')
source=("https://github.com/mopidy/$_pkgname/archive/v${pkgver}.tar.gz")
md5sums=('e49cf22ec601d1bdb58619545bb11600')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

