# Maintainer: PabloSensei

_name=ai-translator
pkgname=${_name}-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Desktop translator powered by Google Gemini AI with 30+ languages and multiple translation styles"
arch=('x86_64')
url="https://github.com/PabloSensei/${_name}"
license=('custom:non-commercial')
provides=("${_name}")
conflicts=("${_name}")

source=("${url}/releases/download/v${pkgver}/${_name}_${pkgver}_amd64.deb")
sha256sums=('13ae911fe77368e9c37c27e64e9549e14d699b6599f530c6639b2863909aebd8')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"
}
