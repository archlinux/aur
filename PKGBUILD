# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.10
pkgrel=2
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('GPL')
depends=('python' 'python-pytz' 'python-dateutil')
makedepends=('python-setuptools')
conflicts=('python-icalendar-git')

source=("https://pypi.python.org/packages/3f/40/a479fd8d450e06ab0965227b3231ac3c4479dbaf424fdbdd1045809dc434/icalendar-3.10.tar.gz")
sha512sums=('363441cde889f5f768e28e0cdf9340d0e1fe16e52a421c4643b8e880cb477b418c12a14853f27605a1cd621ae127e01c5d33795d91bb98b0e8cd4e84c7de9540')

package() {
  cd "icalendar-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
