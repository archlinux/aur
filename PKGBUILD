pkgname=flatbat
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimalist tkinter system monitor overlay (CPU, RAM, GPU, battery, and clock)"
arch=('any')
url="https://github.com/tomasmckenna/flatbat"
license=('MIT')
depends=('python' 'python-psutil' 'tk')
makedepends=('python-setuptools')
source=("flatbat-1.0.0.tar.gz::https://github.com/tomasmckenna/flatbat/archive/refs/tags/v1.0.0.tar.gz")
sha256sums=('60f36a10305b4e4e6a83e1060fe0c274cb32b7bd64724ffae24a223b5d5facde')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
