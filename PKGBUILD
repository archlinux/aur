# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=rocm-hip-runtime
pkgver=4.5.2
pkgrel=1
pkgdesc="Packages to run HIP applications on the AMD platform"
arch=('x86_64')
url="https://rocm-documentation.readthedocs.io/en/latest/"
license=()
depends=('rocm-core' 'rocm-language-runtime' 'rocminfo' 'hip-runtime-amd' 'rocm-llvm' 'rocm-cmake')
makedepends=()
optdepends=('hipify-clang: Translate CUDA code into HIP. Requires CUDA.')
source=()
sha256sums=()
_magic_bit=164

package() {
	mkdir -p "${pkgdir}/opt/rocm/.info"
	echo "${pkgver}-${pkgrel}-$_magic_bit" > "${pkgdir}/opt/rocm/.info/version-hiprt"
}
