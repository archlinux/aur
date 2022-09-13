# Maintainer: jakob <grandchild@gmx.net>

pkgname=nvitop
pkgver=0.8.0
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
sha256sums=('efe9ab5046374b060a6d12ec117e9e4919060c379694ac2a393148e4b2faf702')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
