# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-m3u8
pkgver=0.3.5
pkgrel=1
pkgdesc="Python m3u8 parser"
url="https://github.com/globocom/m3u8"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/08/a8/7d5449e1760a09516d1a49010f7b95b1b6f90186c52f26648e9d0625c5c4/m3u8-${pkgver}.tar.gz")
md5sums=('a554773bff12ba20e715b3f73b59fddc')

build() {
    cd $srcdir/m3u8-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/m3u8-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
