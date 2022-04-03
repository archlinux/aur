# Maintainer: jakob <grandchild@gmx.net>

pkgname=nvitop
pkgver=0.5.4
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
sha256sums=('1e40c141e44c32b8c6bd007d1b3bb05f5a252be34e151382b014d2db8a2c7b71')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
