_pipname=Flask-Session
pkgname=python-flask-session
pkgver=0.3.2
pkgrel=1
pkgdesc='Server side session extension for Flask'
arch=(any)
url='https://pypi.org/project/Flask-Session/'
license=(BSD)
depends=(python-flask python-cachelib)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/6f/46/31d3822898f4767159363a23ce4d84923c0cf3b8a93dcef3b4065676094f/$_pipname-$pkgver.tar.gz")
sha256sums=('0768e2bbf06f963ec1aa711bde7aa32dc39ff70f89b495d6db687d899eae4423')

package() {
  cd $_pipname-$pkgver 
  python setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
