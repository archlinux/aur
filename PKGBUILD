# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=python2-pyspotify
_pkgname=pyspotify
pkgver=2.1.3
pkgrel=1
pkgdesc="A Python Spotify library"
arch=('any')
url="http://pyspotify.mopidy.com/"
license=('APACHE')
depends=('python2' 'libspotify' 'python2-cffi' 'python2-setuptools')
conflicts=('pyspotify-git' 'pyspotify')
source=("https://github.com/mopidy/$_pkgname/archive/v${pkgver}.tar.gz")
md5sums=('2594290cd6d0ec0f7d76ddf94bef32ac')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
