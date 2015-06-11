# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-rainbow-logging-handler
pkgver=2.2.2
pkgrel=1
pkgdesc="Ultimate Python 3 colorized logger with user-custom color"
url="https://github.com/laysakura/rainbow_logging_handler"
depends=('python' )
makedepends=('python-setuptools' )
license=('Public Domain')
arch=('any')
source=('https://pypi.python.org/packages/source/r/rainbow_logging_handler/rainbow_logging_handler-2.2.2.zip')
provides=('python-rainbow-logging-handler-git')
conflicts=('python-rainbow-logging-handler-git')
md5sums=('e24f2cfa9d7f32dafcc6faffae62ee81')

build() {
    cd $srcdir/rainbow_logging_handler-2.2.2
    python setup.py build
}

package() {
    cd $srcdir/rainbow_logging_handler-2.2.2
    python setup.py install --root="$pkgdir" --optimize=1 
}
