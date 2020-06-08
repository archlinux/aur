# Former maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>
# Maintainer: Matthias Schiffer <mschiffer@universe-factory.net>

pkgname=mopidy-mpris
pkgver=3.0.2
pkgrel=1
pkgdesc="Mopidy extension for controlling Mopidy through the MPRIS D-Bus interface"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
  'mopidy>=3.0.0'
  'python-pydbus>=0.6.0'
  'python-pykka>=2.0.1'
  'python-setuptools'
)
provides=('mopidy-mpris')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('992847e1bf9deb549ed4633ebfdafdde875c68f127128a1f91c6d49a83daa74a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
