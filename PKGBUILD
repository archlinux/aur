# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgbase=python-ruffus
pkgname=('python-ruffus' 'python2-ruffus')
pkgver=2.6.3
pkgrel=1
pkgdesc="A lightweight Python library for computational pipelines."
arch=('any')
url="http://www.ruffus.org.uk/"
license=('MIT')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/r/ruffus/ruffus-${pkgver}.tar.gz")
sha256sums=('d78728d802013d91d15e5e939554dabce196967734850fa44634dce47e3e5061')

package_python-ruffus() {
  depends=('python')
  cd "$srcdir/ruffus-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-ruffus() {
  depends=('python2')
  cd "$srcdir/ruffus-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
