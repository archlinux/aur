# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xduugu

pkgname=python2-icalendar
_pkgname=icalendar
pkgver=3.11.3
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('BSD')
depends=('python2' 'python2-pytz' 'python2-dateutil')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/7f/0b/f13fa6ec05f44c13014ab7d7dd2ffae349c94d71151a311a8c5e7198b0a8/${_pkgname}-${pkgver}.tar.gz)
md5sums=('8480bbe6339fc2b8b997c1d899e6f76c')
sha256sums=('6317d716563c41ca44b4694458f0a94734e35bb8c708994eb4503c8638d5d220')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
