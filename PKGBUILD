# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.9.2
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('GPL')
depends=('python' 'python-pytz' 'python-dateutil')
makedepends=('python-distribute')
conflicts=('python-icalendar-git')

source=("https://pypi.python.org/packages/source/i/icalendar/icalendar-${pkgver}.tar.gz")
sha512sums=('da50bba72f7a114263672ebd45cfcca5f7c2eca48538901f595b26ef18bb21a6290da4392c62cc27d1202083fcab7f5bfe6c9a463df38087de0ef764999f7eb1')

package() {
  cd "icalendar-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
