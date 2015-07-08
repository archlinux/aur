# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python2-sigtools
pkgver=1.0
pkgrel=1
pkgdesc="Joblties for working with 3.3's inspect.Signature objects.ib is a set of tools to provide lightweight pipelining in Python."
url="https://pypi.python.org/pypi/sigtools"
arch=(any)
license=('MIT')
depends=('python2' 'python2-funcsigs')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/s/sigtools/sigtools-$pkgver.tar.gz)
sha256sums=('34122ddeb7d0560b59781b8187794da439270af84b19748454d4c6cb9b29d697')

package() {
    cd $srcdir/sigtools-"$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
