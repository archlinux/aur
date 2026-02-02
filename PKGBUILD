# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=air
pkgname=${_base}-bin
pkgver=1.64.5
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
sha256sums_x86_64=('2318802038baead95775b871ea7b6dd40d7e1af2f1bb63f590e86465544bb993')
sha256sums_i686=('ae37f8be0bac4ad266d55699d1aaaad7286621160ef93336d5bdd66aa3416deb')
sha256sums_aarch64=('16127a32d4732b5d60ebf14dc6b407bec3045608bafe8e15caec8bbacdc5b208')

package() {
  install -Dvm755 ${_base} -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${_base}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_base}"
}
