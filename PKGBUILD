# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xduugu

pkgname=python2-icalendar
_pkgname=icalendar
pkgver=3.11.1
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('BSD')
depends=('python2' 'python2-pytz' 'python2-dateutil')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/1e/4a/72be37cd66974799a62c0422a8195f0789fdbdd80c993f607db1fcc8615f/${_pkgname}-${pkgver}.tar.gz)
md5sums=('14c7b299f3a0a2aa944b31fefe95e233')
sha256sums=('7e98dca0ad093bdb18141eb3127c12776c308f67c20af9aa2594e9037f3e71af')

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
