# Maintainer: jakob <grandchild@gmx.net>

pkgname=nvitop
pkgver=0.3.5.5
pkgrel=1
pkgdesc="Interactive NVIDIA-GPU process viewer and GPU process management"
arch=(any)
url="https://github.com/XuehaiPan/nvitop"
license=('GPL3')
depends=(
    python
    python-pynvml
    python-psutil
    python-cachetools
    python-termcolor
    ncurses
)
makedepends=('python-setuptools')
source=("https://github.com/XuehaiPan/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('284fff61625aa24c34ea147ff943544aa954d93b284dfd31133201ca9bf5a2a7')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
