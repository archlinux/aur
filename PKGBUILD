# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.11.3
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('GPL')
depends=('python' 'python-pytz' 'python-dateutil')
makedepends=('python-setuptools')
conflicts=('python-icalendar-git')

source=("https://pypi.python.org/packages/7f/0b/f13fa6ec05f44c13014ab7d7dd2ffae349c94d71151a311a8c5e7198b0a8/icalendar-3.11.3.tar.gz")
sha512sums=('7424d39563fa45d913b1430e30642e4e1ab9b72e5bfb53c8337c8829599aa4fa8f92f2cc5377c477c18e27281e6879f27e388e9966a475e96dd1aaa902eb4083')

package() {
  cd "icalendar-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
