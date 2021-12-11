# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=rocm-language-runtime
pkgver=4.5.2
pkgrel=1
pkgdesc="ROCr - ROCm runtime"
arch=('x86_64')
url="https://rocm-documentation.readthedocs.io/en/latest/"
license=()
depends=('rocm-core' 'hsakmt-roct' 'hsa-rocr' 'rocm-device-libs' 'comgr')
makedepends=()
source=()
sha256sums=()
_magic_bit=164

package() {
	mkdir -p "${pkgdir}/opt/rocm/.info"
	echo "${pkgver}-${pkgrel}-$_magic_bit" > "${pkgdir}/opt/rocm/.info/version-lrt"
}
