# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-rt
pkgver=1.0.1
pkgrel=1
pkgdesc='Interface to the RT (Request Tracker) API'
arch=('any')
url='https://redmine.labs.nic.cz/projects/python-rt'
license=('GPL3')
depends=('python')
source=("https://redmine.labs.nic.cz/attachments/download/337/rt-$pkgver.tar.gz")
sha256sums=('598fa26c5e3734297d283f73dc5b6e69ceb464675a88e5594e899d6ebf1f77c7')

build() {
  cd "$srcdir/rt-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/rt-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
