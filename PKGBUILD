# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-spotify
pkgver=3.1.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from Spotify"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
    'mopidy>=2'
    'python2-pykka>=1.1'
    'python2-pyspotify>=2'
    'python2-setuptools'
    'python2-requests>=2')
makedepends=('python2')
provides=('mopidy-spotify')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('2fa4827b72c627b9d10ee10a5e5d7961')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
