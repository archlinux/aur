# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>

pkgname=mopidy-autoplay
pkgver=0.2.2
pkgrel=1
pkgdesc="Mopidy extension to automatically pick up where you left off and start playing the last track from the position before Mopidy was shut down."
arch=('any')
url="https://github.com/sphh/mopidy-autoplay"
license=('APACHE')
depends=(
  'mopidy>=3'
  python-pykka
  python-setuptools
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/sphh/$pkgname/archive/v$pkgver.tar.gz"
)
sha256sums=('fc49aca41ff5ae77559dabac4219b6d9dfa32962bcabef73c4933548d6d1182b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
