pkgdesc="A high-performance CUDA library dedicated to general matrix-matrix operations in which at least one operand is a sparse matrix"
url='https://docs.nvidia.com/cuda/cusparselt'

pkgname='cusparselt'
pkgver='0.8.1.1'
arch=('x86_64')
pkgrel=2
license=("NVIDIA Software License")
depends=(
    cuda
)
options=(!debug !strip)

source=("${pkgname}-${pkgver}.tar.xz::https://developer.download.nvidia.com/compute/cusparselt/redist/libcusparse_lt/linux-x86_64/libcusparse_lt-linux-x86_64-${pkgver}_cuda13-archive.tar.xz")
sha256sums=('82dd3e5ebc199a27011f58857a80cd825e77bba634ab2286ba3d4e13115db89a')

package() {
    mkdir -p $pkgdir/opt
    cp -r libcusparse_lt-linux-x86_64-${pkgver}_cuda13-archive $pkgdir/opt/cusparselt
}
