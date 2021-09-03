# Maintainer: jakob <grandchild@gmx.net>

pkgname=nvitop
pkgver=0.4.2.2
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
sha256sums=('e93eb21e58633fb29617fb1d4d944f24b594287bf838bae3790cb861bfb63f1c')

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
