# Maintainer: liara (liara at archlinux.info)

pkgname=pygments-base16
pkgver=1.0.2
pkgrel=1
pkgdesc="Base16 styles for Pygments"
url="https://github.com/mohd-akram/base16-pygments"
depends=('python' 'python-pygments' )
makedepends=('python' 'python-setuptools')
license=('MIT')
arch=('any')
source=(https://pypi.python.org/packages/1a/ee/95c777b3ff2c1cc6f43739ed62e9821b0bf950bd1b3c982186e0b543c76d/pygments-base16-${pkgver}.tar.gz)
md5sums=('2e7a10a239d7647ebb790dd885636a93')

build() {
    cd "$srcdir/pygments-base16-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/pygments-base16-${pkgver}/"
    python setup.py install --root="$pkgdir/" --optimize=1 
}
