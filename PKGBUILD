# Maintainer: Vivien Maisonneuve <v dot maisonneuve at gmail dot com>
# Category: devel
pkgname='python-ansicol'
pkgver='0.2.1'
pkgrel=2
pkgdesc='A Python module to color screen output using ANSI escape sequences'
arch=('any')
url='http://github.com/vivienm/python-ansicol'
license=('GPL3')
depends=('python')
source=("https://pypi.python.org/packages/source/a/ansicol/ansicol-$pkgver.tar.gz")
md5sums=('246e72f115bf40b31c1b9d646a18d0cd')

package() {
    cd "$srcdir/ansicol-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
