# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=air
pkgname=${_base}-bin
pkgver=1.66.0
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
sha256sums_x86_64=('a170ae4eb2504d9770cd9b9ab207680129f3b761591de6c106c5d9dbc22e7f34')
sha256sums_i686=('6c2c05aa65c85fe839ef1217f35f2db46c48d77c0177e88651c0345c1c57fb24')
sha256sums_aarch64=('91f5e55e28dc322a9f9a2f7bcfe1fe85aaf78309aa3ca023efac3da4cf901621')

package() {
  install -Dvm755 ${_base} -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${_base}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_base}"
}
