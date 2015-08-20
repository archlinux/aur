# Maintainer: Alexandre Petitjean <alpetitjean at gmail dot com>

pkgname=mopidy-mpris
pkgver=1.3.1
pkgrel=1
pkgdesc="Mopidy extension for controlling Mopidy through the MPRIS D-Bus interface"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=0.18'
	'python2-pykka>=1.1'
	'python2-setuptools'
	'python2-dbus')
makedepends=('python2')
provides=('mopidy-mpris')
source=("https://github.com/mopidy/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('b6df6542483ea1fddf926837c2884f92')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
