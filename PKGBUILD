# Maintainer: David Barchiesi <david@barchie.si>

pkgname=python-filesplitter
pkgver=2.0
pkgrel=1
pkgdesc="File splitter is a tool that split large file into multiple small file"
arch=('any')
url="https://github.com/asrmarco13/the-file-splitter"
license=('GPLv3')
makedepends=('python-setuptools')
_name="FileSplitter"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('1ab81f811823c8f85a3cecdd94ebd22f')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
