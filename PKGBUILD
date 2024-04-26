# Maintainer: Luís Guimarães <obvionaoe@protonmail.com>

pkgname=rofi-browser-bin
_bin_name=rofi-browser
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple profile launcher for Mozilla Firefox-based browsers"
arch=('x86_64')
url="https://github.com/obvionaoe/rofi-browser/"
license=('MIT')
depends=(rofi)
conflicts=(rofi-browser)
source_i386=("${_bin_name}_$pkgver_linux_386.tar.gz::$url/releases/download/1.0.0/rofi-browser_1.0.0_linux_386.tar.gz")
sha256sums_i386=(219772dc3ff3e20c06df9b99ba484a3c529dd5271414bc9cb8ec9f8972b5fd20)
source_x86_64=("${_bin_name}_$pkgver_linux_amd64.tar.gz::$url/releases/download/1.0.0/rofi-browser_1.0.0_linux_amd64.tar.gz")
sha256sums_x86_64=(45b2fae47ee4b28436d5832f612039416ec1ae0e2b40c73dab6866dcd37319b4)
source_aarch64=("${_bin_name}_$pkgver_linux_arm64.tar.gz::$url/releases/download/1.0.0/rofi-browser_1.0.0_linux_arm64.tar.gz")
sha256sums_aarch64=(9124f9baebf3a3cdeb3eb3fb2283f6710b4536399a89e4f5a48f1c0317477dcc)

package() {
  cd "$srcdir"
  install -DT ${_bin_name} "${pkgdir}/usr/bin/${_bin_name}"
  install -DT LICENSE "${pkgdir}/usr/share/licenses/${_bin_name}/LICENSE"
  install -DT README.md "${pkgdir}/usr/share/doc/${_bin_name}/README.md"
}
