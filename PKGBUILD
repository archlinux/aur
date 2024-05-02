# Maintainer: Luís Guimarães <obvionaoe@protonmail.com>

pkgname=rofi-browser-bin
_bin_name=rofi-browser
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple profile launcher for Mozilla Firefox-based browsers"
arch=('x86_64')
url="https://github.com/obvionaoe/rofi-browser/"
license=('MIT')
depends=(rofi glibc)
conflicts=(rofi-browser)
provides=(rofi-browser)
source_i386=(${_bin_name}_${pkgver}_linux_386.tar.gz::${url}/releases/download/${pkgver}/rofi-browser_${pkgver}_linux_386.tar.gz)
sha256sums_i386=(9928dc4cfdc89cfce0ea292e334e7c445b18a80b662070547fcf339caa15a5e0)
source_x86_64=(${_bin_name}_${pkgver}_linux_amd64.tar.gz::${url}/releases/download/${pkgver}/rofi-browser_${pkgver}_linux_amd64.tar.gz)
sha256sums_x86_64=(1267127898edca9d36e8ecdb3f667bdd9e9a7c9749ce0360d5e23f4cf1965add)
source_aarch64=(${_bin_name}_${pkgver}_linux_arm64.tar.gz::${url}/releases/download/${pkgver}/rofi-browser_${pkgver}_linux_arm64.tar.gz)
sha256sums_aarch64=(14f02ad54f72a68002cc7a8d9e3a6da1d3c6bc598a5b5cc98644f4a619983bc1)

package() {
  cd "$srcdir"
  install -DT ${_bin_name} "${pkgdir}/usr/bin/${_bin_name}"
  install -DT LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -DT README.md "${pkgdir}/usr/share/doc/${_bin_name}/README.md"
}
