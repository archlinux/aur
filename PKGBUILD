#Maintainer Reto <reto@labrat.space>
pkgname='python-pywatchman'
pkgver=1.4.1
pkgrel=0
pkgdesc="Watchman client for python"
url="https://github.com/facebook/watchman"
depends=('python')
optdepends=('watchman')
license=('Apache')
arch=('x86_64')
makedepends=('python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/p/pywatchman/pywatchman-$pkgver.tar.gz")

package() {
   cd "$srcdir/pywatchman-$pkgver"
   python setup.py build
   python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

md5sums=('d770d09bd105e83013f63492fce70c6f')
