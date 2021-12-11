# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=rocm-opencl-sdk
pkgver=4.5.2
pkgrel=1
pkgdesc="Develop applications in OpenCL for the AMD platform"
arch=('x86_64')
url="https://rocm-documentation.readthedocs.io/en/latest/"
license=()
depends=('rocm-core' 'rocm-language-runtime' 'rocm-opencl-runtime' 'rocm-llvm')
makedepends=()
source=()
sha256sums=()
_magic_bit=164

package() {
	mkdir -p "${pkgdir}/opt/rocm/.info"
	echo "${pkgver}-${pkgrel}-$_magic_bit" > "${pkgdir}/opt/rocm/.info/version-ocl-sdk"
}
