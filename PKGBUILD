# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.9.0
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('GPL')
depends=('python' 'python-pytz' 'python-dateutil')
makedepends=('python-distribute')
conflicts=('python-icalendar-git')

source=("https://pypi.python.org/packages/source/i/icalendar/icalendar-${pkgver}.tar.gz")
sha512sums=('a937882046666212d011cbd5963f43e3c2ebc677c55f1ac425dd77a08201a204498881986208d40e2e93b163f9f51b285cb3a1250f07d01f9b6a968c4e24065d')

package() {
  cd "icalendar-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
