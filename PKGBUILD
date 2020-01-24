# Maintainer: Fergus Longley <ferguslongley at gmail dot com>
# Contributer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-scrobbler
pkgver=2.0.0
pkgrel=1
pkgdesc="Mopidy extension for scrobbling played tracks to Last.fm"
arch=('any')
url="https://github.com/mopidy/mopidy-scrobbler/"
license=('APACHE')
depends=(
       'mopidy>=3.0.0'
       'python-pylast>=2.2.0'
       'python-pykka>=2.0.1'
       'python-setuptools'
)
makedepends=('python')
provides=('mopidy-scrobbler')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f4c2006a35ff25b578cdb4927eb667052b23641f140703895350036f8d4145e7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
