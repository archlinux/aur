pkgname=flatbat
pkgver=1.0.2
pkgrel=1
pkgdesc="Minimalist tkinter system monitor overlay (CPU, RAM, GPU, battery, and clock)"
arch=('any')
url="https://github.com/tomasmckenna/flatbat"
license=('MIT')
depends=('python' 'python-psutil' 'tk')
makedepends=('python-setuptools')
source=("flatbat-1.0.2.tar.gz::https://github.com/tomasmckenna/flatbat/archive/refs/tags/v1.0.2.tar.gz")
sha256sums=('da15bfd897f7c3d6919f7a6024b839df6732db7541809bcb98c6082d02df3db5')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
