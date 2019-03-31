# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Jose M. Dana <dana.develop - gmail>

pkgname=python-memprof
pypiname=memprof
pkgver=0.3.6
pkgrel=1
pkgdesc="A memory profiler for Python. It logs and plots the memory usage of all the variables."
arch=(any)
url="http://jmdana.github.io/memprof/"
license=('GPL')
depends=("python-matplotlib" "cython")
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/m/memprof/memprof-$pkgver.tar.gz")
md5sums=('6ee4b90bb7c665cb0248c2d0b697d6b9')

package() {
  cd "$srcdir/$pypiname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

