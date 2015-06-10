# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Archie <xMickael@ifrance.com>

pkgname=python2-vobject
pkgver=0.8.1c
pkgrel=5
pkgdesc='Module for parsing and generating vCard and vCalendar files'
url='http://vobject.skyhouseconsulting.com'
license=('Apache')
arch=('any')
depends=('python2-dateutil' 'python2-pyicu')
makedepends=('python2-distribute')
source=("http://vobject.skyhouseconsulting.com/vobject-$pkgver.tar.gz")
sha256sums=('594113117f2017ed837c8f3ce727616f9053baa5a5463a7420c8249b8fc556f5')

package() {
  cd "vobject-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
