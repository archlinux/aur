# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.11
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('GPL')
depends=('python' 'python-pytz' 'python-dateutil')
makedepends=('python-setuptools')
conflicts=('python-icalendar-git')

source=("https://pypi.python.org/packages/3c/28/632d130dccffa997e92a86e8178166a5f57ceef58c6ec5a21db3e6e61b69/icalendar-3.11.tar.gz")
sha512sums=('cd6348a76ddcd9757e717e2fbcdee721d81f0e6502e16c8cec7f7e6d2fb46a7124c9c3b1b008a455c06401f02c3a7ea2c9db77a51b1283cc396ebf68bc649493')

package() {
  cd "icalendar-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
