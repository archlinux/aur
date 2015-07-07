# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python2-venusian
_pkgname=venusian
pkgver=1.0
pkgrel=1
pkgdesc="A library for deferring decorator actions."
license=('custom:BSD')
arch=('any')
url="http://www.repoze.org"
depends=('python2')
replaces=('venusian')
conflicts=('venusian')
provides=('venusian')
source=(http://pypi.python.org/packages/source/v/venusian/venusian-$pkgver.tar.gz)
md5sums=('dccf2eafb7113759d60c86faf5538756')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
}
