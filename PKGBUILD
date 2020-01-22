# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-spotify
pkgver=4.0.1
pkgrel=1
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
sha256sums=('8e90d9a18958145ef55fcd56f5f8f958e2a93d5b7451189e1ab9445000ca88a9')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
