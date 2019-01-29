# Maintainer: Clar Fon <them@lightdark.xyz>

pkgname=uap-core
pkgver=0.6.4
pkgrel=1
pkgdesc="Regex file for BrowserScope's user agent parser"
arch=('any')
url='https://github.com/ua-parser/uap-core'
license=('Apache')
source=("https://github.com/ua-parser/uap-core/archive/v${pkgver}.tar.gz")
sha256sums=('8f540b0ba16d8802e3d02b93b3aa214f973a54d6642fa638869a1ef6157ad138')

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/regexes.yaml" "${pkgdir}/usr/share/uap-core/regexes.yaml"
}
