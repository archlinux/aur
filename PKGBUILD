# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-terminaltables
_pyname=terminaltables
pkgname=('python-terminaltables' 'python2-terminaltables')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
pkgver=3.0.0
pkgrel=1
pkgdesc="Generate simple tables in terminals from a nested list of strings"
arch=('any')
url="https://github.com/Robpol86/terminaltables"
license=('MIT')
source=("https://github.com/Robpol86/$_pyname/archive/v$pkgver.tar.gz")
sha512sums=('608122b64d1c5da169fff66bff3d974e68d4d34eb42a071062033d714a4371faaeb1acb64bd463571b8743e203986c936b82d12b20b666cb990ba2f0f039b242')

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
