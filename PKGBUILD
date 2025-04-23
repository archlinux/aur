pkgname=flatbat
pkgver=1.0.1
pkgrel=2
pkgdesc="Minimalist tkinter system monitor overlay (CPU, RAM, GPU, battery, and clock)"
arch=('any')
url="https://github.com/tomasmckenna/flatbat"
license=('MIT')
depends=('python' 'python-psutil' 'tk')
makedepends=('python-setuptools')
source=("flatbat-1.0.1.tar.gz::https://github.com/tomasmckenna/flatbat/archive/refs/tags/v1.0.1.tar.gz")
sha256sums=('4422cee3ca2c4a403ab9edd25783e599f871307b425f7e86e9c2ab11a3b72c88  Downloads/flatbat-1.0.1.tar.gz')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
