# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=rocm-hip-libraries
pkgver=4.5.2
pkgrel=1
pkgdesc="Develop applications using HIP and libraries for AMD platforms"
arch=('x86_64')
url="https://rocm-documentation.readthedocs.io/en/latest/"
license=()
depends=('rocm-core' 'rocm-hip-runtime'
        'rocsparse' 'rccl' 'rocsolver' 'rocrand' 'rocfft' 'rocblas'
        'rocalution' 'hipblas' 'hipfft' 'hipsparse' 'hipfort')
makedepends=()
source=()
sha256sums=()
_magic_bit=164

package() {
	mkdir -p "${pkgdir}/opt/rocm/.info"
	echo "${pkgver}-${pkgrel}-$_magic_bit" > "${pkgdir}/opt/rocm/.info/version-hip-libraries"
}
