# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-tianshou
pkgver=0.4.4
pkgrel=1
pkgdesc="An elegant PyTorch deep reinforcement learning library."
arch=('any')
url="https://github.com/thu-ml/tianshou"
license=('MIT')
depends=('python' 'python-gym' 'python-tqdm' 'python-numpy' 'tensorboard' 'python-pytorch' 'python-numba' 'python-h5py')
options=(!emptydirs)
source=("https://github.com/thu-ml/tianshou/releases/download/v${pkgver}/tianshou-${pkgver}.tar.gz")
sha384sums=('d0c846aa08c7318d7918cf727ca76e7807c2208ec5bcbf9935759e82b391bc94bb0c9e6bbb4eba0e2705645a7da0698e')

package() {
    cd "$srcdir/tianshou-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
