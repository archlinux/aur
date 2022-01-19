_pipname=Flask-Session
pkgname=python-flask-session
pkgver=0.4.0
pkgrel=1
pkgdesc='Server side session extension for Flask'
arch=(any)
url='https://pypi.org/project/Flask-Session/'
license=(BSD)
depends=(python-flask python-cachelib)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/d9/4d/f307b41232846a9658edc86f9d8423558bc93229151ae6249d9e79ccf5fd/$_pipname-$pkgver.tar.gz")
sha256sums=('c9ed54321fa8c4ca0132ffd3369582759eda7252fb4b3bee480e690d1ba41f46')

package() {
  cd $_pipname-$pkgver 
  python setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
