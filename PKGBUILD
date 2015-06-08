# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=pyspotify
pkgver=1.12
pkgrel=2
pkgdesc="A Python Spotify library"
arch=('any')
url="http://pyspotify.mopidy.com/"
license=('APACHE')
depends=('python2' 'libspotify')
makedepends=('python2-distribute')
optdepends=('python-pyalsaaudio: Used by example applications.')
conflicts=('pyspotify-git')
provides=('pyspotify')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('ce47484df6011ad9a3eeb37368f30880')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
