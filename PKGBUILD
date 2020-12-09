# Maintainer: Peter Taylor <me@et1.uk>
pkgname=python-tinydownload-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Automatic Ripping Machine packaged for Arch Linux"
url="https://github.com/ritiek/tinydownload"
arch=('any')
license=('MIT')
depends=(
    'python'
    'python-requests'
)
source=("git://github.com/ritiek/tinydownload")
md5sums=('SKIP')

build() {
    cd $srcdir/tinydownload
    python setup.py build
}

package() {
    cd $srcdir/tinydownload
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}