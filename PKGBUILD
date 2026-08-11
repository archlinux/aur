# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=air
pkgname=${_base}-bin
pkgver=1.67.4
pkgrel=1
pkgdesc="Live reload for Go apps"
url="https://github.com/${_base}-verse/${_base}"
arch=(x86_64 i686 aarch64)
license=(GPL-3.0-or-later)
depends=(go)
conflicts=("${_base}")
provides=("${_base}")
source_x86_64=("${_base}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_base}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_base}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_base}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c8cc405210e557e2681275688ce700441eac53db9fb42bb58764874ee9aa783d')
sha256sums_i686=('3904363e2fcdfe22c6ad0514b4fb8648dc3d5d9ca19cb38fb0af4a0263cf3ecb')
sha256sums_aarch64=('3b138e3cc01c6f1f077f555baa1db45215c02f1aa57db8ab0b5b082a76a45743')

package() {
  install -Dvm755 ${_base} -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${_base}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_base}"
}
