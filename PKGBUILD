# Maintainer: PabloSensei

_name=ai-translator
pkgname=${_name}-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop translator powered by Google Gemini AI with 30+ languages and multiple translation styles"
arch=('x86_64')
url="https://github.com/PabloSensei/${_name}"
license=('custom:non-commercial')
provides=("${_name}")
conflicts=("${_name}")

source=("${url}/releases/download/v${pkgver}/${_name}_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"
}
