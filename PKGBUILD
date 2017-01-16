# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.11.2
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('GPL')
depends=('python' 'python-pytz' 'python-dateutil')
makedepends=('python-setuptools')
conflicts=('python-icalendar-git')

source=("https://pypi.python.org/packages/e7/e7/71810ac9d3d5a062d3d7d16090ce2ea3e7877c2124afe23f9f7b8e2ffedd/icalendar-3.11.2.tar.gz")
sha512sums=('8e2d1d5e22cff342b51fd8fdf14897d8e7b575c7788f6b1d6a4c9342da1e062a4aa9461f6baeaf6f131b43715ab67bcdbb32d03f3c628b995816489efc12b345')

package() {
  cd "icalendar-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
