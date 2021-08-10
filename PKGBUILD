# Maintainer: Clar Fon <them@lightdark.xyz>

pkgname=uap-core
pkgver=0.6.9
pkgrel=1
pkgdesc="Regex file for BrowserScope's user agent parser"
arch=('any')
url='https://github.com/ua-parser/uap-core'
license=('Apache')
source=("https://github.com/ua-parser/uap-core/archive/v${pkgver}.tar.gz")
sha256sums=('65cee73f992afb035120f146be1f1c91b4a12cda58e29e14d3ef249bd9327a19')

package() {
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/regexes.yaml" "${pkgdir}/usr/share/uap-core/regexes.yaml"
}
