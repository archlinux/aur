# Maintainer: 3yan <zelenkaj@vscht.cz>

pkgname=python-rawprasslib
pkgver=0.0.2
pkgrel=1
pkgdesc="Python Thermo/Finnigan .raw file format reader"
arch=('x86_64')
url="https://gitlab.science.ru.nl/jzelenka/rawprasslib/"
license=('MIT')
checkdepends=('python-numpy')
makedepends=('python-numpy')
source=("https://files.pythonhosted.org/packages/de/38/d84a1d8fd75e38edc192eca306da9ca0e91a0f91355b7264888bee9bc800/rawprasslib-$pkgver.tar.gz")
sha256sums=('93983bec6e286919e4a7a800cc25b55623083942ca86f976651e774e6d45d674')

package() {
        cd "$srcdir/rawprasslib-$pkgver"
        python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
