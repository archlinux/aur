# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.9.1
pkgrel=2
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('GPL')
depends=('python' 'python-pytz' 'python-dateutil')
makedepends=('python-distribute')
conflicts=('python-icalendar-git')

source=("https://pypi.python.org/packages/source/i/icalendar/icalendar-${pkgver}.tar.gz")
sha512sums=('96edfd26a90cc34d90bfe01222403a86390874c5a895ad12f27e616cc248df5b634ac64be386dc72c1c72fb1afcacf6224cf8fbd006ff4f7624e802fced55042')

package() {
  cd "icalendar-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
