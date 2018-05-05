pkgname=python-alerta-client
_pkgvergit=commit=3ba1079a272ace7721c97daa218a4b33fa306f8d
pkgver=5.0.12
pkgrel=1
arch=('any')
url=https://github.com/alerta/python-alerta-client
license=('MIT')
depends=('python' 'python-requests' 'python-pytz' 'python-setuptools' 'python-tabulate' 'python-click' 'python-six')
#makedepends=('python-setuptools')
source=("git+https://github.com/alerta/python-alerta-client.git#$_pkgvergit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  cat VERSION
}

package() {
    cd $srcdir/$pkgname/
    python setup.py install --root $pkgdir
}
