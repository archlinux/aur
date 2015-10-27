# Maintainer: Alfred Krohmer <devkid@devkid.net>
pkgname=python-mutagenx
pkgver=1.24
pkgrel=1
pkgdesc="read and write audio tags for many formats in Python 3"
url="https://github.com/LordSputnik/mutagen/"
depends=('python')
conflicts=('mutagen')
license=('GPL2')
arch=('any')
source=("https://pypi.python.org/packages/source/m/mutagenx/mutagenx-$pkgver.tar.gz")
md5sums=('e6815203bfc4b8cd46e7405525a28f14')

build() {
    cd $srcdir/mutagenx-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/mutagenx-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
