# Maintainer: Antonio Rojas <arojas@archlinux.org>

_pipname=Flask-Silk
pkgname=python-flask-silk
pkgver=0.2
pkgrel=6
pkgdesc='Adds silk icons to your Flask application or blueprint, or extension'
url='https://pythonhosted.org/Flask-Silk/index.html'
arch=('any')
license=('custom:BSD')
depends=('python-flask')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/F/Flask-Silk/Flask-Silk-$pkgver.tar.gz")
sha256sums=('80a21faf09fe257443a4fbbf8cd3f6c793c567c87ff784751a1c38d2e18b5fbe')

package() {
  cd $_pipname-$pkgver 
  python setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
