# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=legendarium
pkgname=('python-scielo-legendarium')
pkgver=2.0.2
pkgrel=1
pkgdesc="SciELO's bibliographic legend handling library"
arch=('any')
url='https://github.com/scieloorg/legendarium'
license=('BSD')
makedepends=('python-setuptools')
options=(!emptydirs)
sha256sums=('7c98fa66af024f7088ffbda1439786ec14701a76c0eceab8e853d30fb834e48f')
_pypi='https://files.pythonhosted.org/packages'
_path='a6/01/7832b64d60dcd11f012c5738425efa8c8e6af76a55d8f7aea778f00b0d49'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
