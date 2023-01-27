# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-tianshou
pkgver=0.4.11
pkgrel=1
pkgdesc="An elegant PyTorch deep reinforcement learning library."
arch=('any')
url="https://github.com/thu-ml/tianshou"
license=('MIT')
depends=('python' 'python-gym' 'python-tqdm' 'python-numpy' 'tensorboard' 'python-pytorch' 'python-numba' 'python-h5py')
options=(!emptydirs)
source=("https://github.com/thu-ml/tianshou/releases/download/v${pkgver}/tianshou-${pkgver}.tar.gz")
sha384sums=('29e86938c2e8d5451dd0fdb7556490211d5827ee548ce325c23d2e14079461eedbb14f7a5344014305d14ab7c9060d40')

package() {
    cd "$srcdir/tianshou-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
