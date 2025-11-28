# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=air
pkgname=${_base}-bin
pkgver=1.63.4
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
sha256sums_x86_64=('12162e5ab6a8e87a0c3ae48b4eb0acfa5cc43214c24d480b47dda707547e13ee')
sha256sums_i686=('712ad87c648731f96346a9bc2223d132c4c178005a791f165e2ed7608d5fc3ea')
sha256sums_aarch64=('67d283fa96ae278976837fcdf0f849b8f1d3bf033f72300d600d4e3b6767ab3d')

package() {
  install -Dvm755 ${_base} -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${_base}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_base}"
}
