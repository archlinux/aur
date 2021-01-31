# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=python-retry
_name=retry
pkgver=0.9.2
pkgrel=1
pkgdesc="Easy to use retry decorator."
url="https://github.com/invl/retry"
depends=('python')
makedepends=()
license=('Apache')
arch=('any')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('81089364adc2d9a271f1b71eb9ef312b')

build() {
    cd $srcdir/retry-0.9.2
    python setup.py build
}

package() {
    cd $srcdir/retry-0.9.2
    python setup.py install --root="$pkgdir" --optimize=1 
}
