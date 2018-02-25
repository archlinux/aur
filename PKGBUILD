# Maintainer: Ivan Semkin (ivan at semkin dot ru)

_pkgname=vdf
pkgname=(python-vdf python2-vdf)
pkgver=2.3
pkgrel=1
pkgdesc="Library for working with Valve's VDF text format"
arch=('any')
url='https://github.com/ValvePython/vdf'
license=('MIT')
depends=()
makedepends=('python-setuptools')
source=("https://github.com/ValvePython/vdf/archive/v$pkgver.tar.gz")
sha256sums=('d129edb0ab0cac55f9cd632959f05b8cbbe0babe017cf9671b8b379ec3186148')

package_python-vdf() {
  depends=('python' 'python-nose' 'python-coverage' 'python-mock')
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
}

package_python2-vdf() {
  depends=('python2' 'python2-nose' 'python2-coverage' 'python2-mock')
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
