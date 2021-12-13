# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-spotify
pkgver=4.1.1
pkgrel=2
pkgdesc="Mopidy extension for playing music from Spotify"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
  'mopidy>=3'
  python-pykka
  python-pyspotify
  python-setuptools
  python-requests
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/mopidy/$pkgname/archive/v$pkgver.tar.gz"
)
sha256sums=('623f139703b633f06391cfc4e6d3e63936f0815fac1990bbbb798d6e377ea400')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
