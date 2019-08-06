# Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=ktlint
pkgver=0.34.2
pkgrel=1
pkgdesc="An anti-bikeshedding Kotlin linter with built-in formatter"
arch=('any')
url="https://ktlint.github.io/"
license=('CUSTOM: MIT')
depends=('java-runtime')
validpgpkeys=(A2570288E10932263E8326CBAA49C633B4734832)
source=(ktlint-${pkgver}::https://github.com/pinterest/ktlint/releases/download/${pkgver}/ktlint
        https://raw.githubusercontent.com/pinterest/ktlint/${pkgver}/LICENSE
        ktlint-${pkgver}.asc::https://github.com/pinterest/ktlint/releases/download/${pkgver}/ktlint.asc)
sha256sums=('62f1123496548dbc5407da594823b475352043b49d29a925445ae8a690273aec'
            'b45bdb3357e761d4b1300470833cf5e5e9fafc32a5f98efef214ba926b0120d5'
            'SKIP')

package() {
  cd "${srcdir}"

  install -D -m755 ktlint-${pkgver} "${pkgdir}/usr/bin/ktlint"
  install -D -m644 LICENSE "${pkgdir}/usr/share/license/ktlint/LICENSE"
}

