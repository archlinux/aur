# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
_base=air
pkgname=${_base}-bin
pkgver=1.63.0
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
sha256sums_x86_64=('80ce7b79a205b4e8a48ca25f84043924a41a76a32983dbb731eb696ccdef3214')
sha256sums_i686=('b50eef58ff0ee2b367898bf0599e677aa6b405a25d3189f5e6b353180e167848')
sha256sums_aarch64=('f84203cd9ca0adf4e368b10e1635639893010c08f2a9ecc39684eff9be1f5b4a')

package() {
  install -Dvm755 ${_base} -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${_base}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_base}"
}
