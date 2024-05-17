# Maintainer: Luís Guimarães <obvionaoe@protonmail.com>

pkgname=rofi-browser-bin
_bin_name=rofi-browser
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple profile launcher for Mozilla Firefox-based browsers"
arch=('x86_64')
url="https://github.com/obvionaoe/rofi-browser/"
license=('MIT')
depends=(rofi glibc)
conflicts=(rofi-browser)
provides=(rofi-browser)
source_i386=(${_bin_name}_${pkgver}_linux_386.tar.gz::${url}/releases/download/${pkgver}/rofi-browser_${pkgver}_linux_386.tar.gz)
sha256sums_i386=(94001396955887d8bd0c89287626e5bfefbf8548c745e88087bf6ced99748016)
source_x86_64=(${_bin_name}_${pkgver}_linux_amd64.tar.gz::${url}/releases/download/${pkgver}/rofi-browser_${pkgver}_linux_amd64.tar.gz)
sha256sums_x86_64=(054a16fd8f1c830c37d510cac59011151ccb0df4dd3dea8fdcbf1321ba5fc4d4)
source_aarch64=(${_bin_name}_${pkgver}_linux_arm64.tar.gz::${url}/releases/download/${pkgver}/rofi-browser_${pkgver}_linux_arm64.tar.gz)
sha256sums_aarch64=(50fbe210d5fd5c8e9b3f208f08b022ac82585ec929fb7234c0e8b495c1a77196)

package() {
  cd "$srcdir"
  install -DT ${_bin_name} "${pkgdir}/usr/bin/${_bin_name}"
  install -DT LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -DT README.md "${pkgdir}/usr/share/doc/${_bin_name}/README.md"
}
