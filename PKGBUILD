pkgdesc="A high-performance CUDA library dedicated to general matrix-matrix operations in which at least one operand is a sparse matrix"
url='https://docs.nvidia.com/cuda/cusparselt'

pkgname='cusparselt'
pkgver='0.7.1.0'
arch=('x86_64')
pkgrel=1
license=("NVIDIA Software License")
depends=(
    cuda
)
options=(!debug !strip)

source=("${pkgname}-${pkgver}.tar.gz::https://developer.download.nvidia.com/compute/cusparselt/redist/libcusparse_lt/linux-x86_64/libcusparse_lt-linux-x86_64-${pkgver}-archive.tar.xz")
sha256sums=('a0d885837887c73e466a31b4e86aaae2b7d0cc9c5de0d40921dbe2a15dbd6a88')

package() {
    mkdir -p $pkgdir/opt
    cp -r libcusparse_lt-linux-x86_64-${pkgver}-archive $pkgdir/opt/cusparselt
}
