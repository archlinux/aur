pkgdesc="A high-performance CUDA library dedicated to general matrix-matrix operations in which at least one operand is a sparse matrix"
url='https://docs.nvidia.com/cuda/cusparselt'

pkgname='cusparselt'
pkgver='0.6.2.3'
arch=('x86_64')
pkgrel=1
license=("NVIDIA Software License")
depends=(
    cuda
)
options=(!debug)

source=("${pkgname}-${pkgver}.tar.gz::https://developer.download.nvidia.com/compute/cusparselt/redist/libcusparse_lt/linux-x86_64/libcusparse_lt-linux-x86_64-${pkgver}-archive.tar.xz")
sha256sums=('81f649b786869e8c10db08b23a919e0fd223a4d5001e0a1432d392143370729d')

package() {
    mkdir -p $pkgdir/opt
    cp -r libcusparse_lt-linux-x86_64-${pkgver}-archive $pkgdir/opt/cusparselt
}
