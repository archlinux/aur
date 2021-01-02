# Maintainer: Paulo Castro <p.oliveira.castro@gmail.com>
pkgname=python-drawnow
pkgver=0.72.5
pkgrel=1
pkgdesc="MATLAB-like drawnow"
arch=('any')
url="https://github.com/stsievert/python-drawnow"
license=('MIT')
depends=('python' 'python-matplotlib')
options=(!emptydirs)
source=("https://github.com/stsievert/python-drawnow/archive/${pkgver}.tar.gz")
md5sums=('3bea9c6cc78aa93cb1633c2fc9f9b6de')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
