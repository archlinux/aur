# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.11.4
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('GPL')
depends=('python' 'python-pytz' 'python-dateutil')
makedepends=('python-setuptools')
conflicts=('python-icalendar-git')

source=("https://pypi.python.org/packages/bb/6a/486b4a882d03042e569a40a4e17aebcb1d8d2b8f54620007adaba43c67af/icalendar-3.11.4.tar.gz#md5=5e05eb70f484abf8e8a3ac3ec5af48df")
sha512sums=('ac51717cced4f1730fa0e81ca5dec5f4deda04f3bb78d05c5e56b9e50b7f79f556a2c7d76fb7b50b8c6d5c2751a79b09a93230ff2e2c78df9106446b9f867f6e')

package() {
  cd "icalendar-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
