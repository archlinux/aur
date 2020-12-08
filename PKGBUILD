# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-spotify
pkgver=4.1.0
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
sha256sums=('3a02a8efb8497250ad5996efdc12370c81a3e3c3ad0d86b889a5bc5faeaa51f5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
