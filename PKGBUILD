# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-spotify
pkgver=1.4.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from Spotify"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=1.0'
	'python2-pykka>=1.1'
	'pyspotify>=1.9'
	'pyspotify<2'
	'python2-setuptools')
makedepends=('python2')
provides=('mopidy-spotify')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('11aea06f45de81b544d25b1137a685ed')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
