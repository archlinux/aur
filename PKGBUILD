# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname='python-memcached'
pkgver=1.57
pkgrel=1
pkgdesc="A python memcached client library"
arch=('any')
url="https://github.com/linsomniac/python-memcached"
license=('PSF')
source=("https://pypi.python.org/packages/source/p/python-memcached/python-memcached-${pkgver}.tar.gz")
makedepends=('python')
depends=('python' 'memcached')
md5sums=('de21f64b42b2d961f3d4ad7beb5468a1')


package() {
  cd "$srcdir/python-memcached-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
