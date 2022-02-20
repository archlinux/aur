# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=legendarium
pkgname=('python-scielo-legendarium')
pkgver=2.0.6
pkgrel=1
pkgdesc="SciELO's bibliographic legend handling library"
arch=('any')
url='https://github.com/scieloorg/legendarium'
license=('BSD')
makedepends=('python-setuptools')
options=(!emptydirs)
sha256sums=('21fa3d937e9f72a8c63178391bd2656efdbf1c9283edcc0bfe43ad1fa1969608')
_pypi='https://files.pythonhosted.org/packages'
_path='12/ac/2162370faaab046879fb822f900d512cb6f858e0eb96227cd790993b3bcb'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
