# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-terminaltables
_pyname=terminaltables
pkgname=('python-terminaltables' 'python2-terminaltables')
makedepends=('python' 'python2')
pkgver=2.1.0
pkgrel=1
pkgdesc="Generate simple tables in terminals from a nested list of strings"
arch=('any')
url="https://github.com/Robpol86/terminaltables"
license=('MIT')
source=("https://github.com/Robpol86/$_pyname/archive/v$pkgver.tar.gz")
sha512sums=('6b6d16164936121c7e5d2034bba2e28679ddd488cd34d97ea8c92431cbe4ae9bcda677d3a1978860f70cebbb3108c6dceaf703e11ac74013bef60d7f89b039ef')

package_python-terminaltables() {
  depends=('python')
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install -O1 --root=$pkgdir
}

package_python2-terminaltables() {
  depends=('python2')
  cd "$srcdir/$_pyname-$pkgver"
  python2 setup.py install -O1 --root=$pkgdir
}

# vim:set et sw=2 ts=2 tw=79: 
