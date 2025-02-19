pkgdesc="A high-performance CUDA library dedicated to general matrix-matrix operations in which at least one operand is a sparse matrix"
url='https://docs.nvidia.com/cuda/cusparselt'

pkgname='cusparselt'
pkgver='0.7.0.0'
arch=('x86_64')
pkgrel=1
license=("NVIDIA Software License")
depends=(
    cuda
)
options=(!debug)

source=("${pkgname}-${pkgver}.tar.gz::https://developer.download.nvidia.com/compute/cusparselt/redist/libcusparse_lt/linux-x86_64/libcusparse_lt-linux-x86_64-${pkgver}-archive.tar.xz")
sha256sums=('6082f3d7f024b0183225d48361ca8436fdf30d5833e3595c6c145c03171c13ee')

package() {
    mkdir -p $pkgdir/opt
    cp -r libcusparse_lt-linux-x86_64-${pkgver}-archive $pkgdir/opt/cusparselt
}
