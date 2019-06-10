# Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=ktlint
pkgver=0.33.0
pkgrel=1
pkgdesc="An anti-bikeshedding Kotlin linter with built-in formatter"
arch=('any')
url="https://ktlint.github.io/"
license=('CUSTOM: MIT')
depends=('java-runtime')
validpgpkeys=(A2570288E10932263E8326CBAA49C633B4734832)
source=(ktlint-${pkgver}::https://github.com/shyiko/ktlint/releases/download/${pkgver}/ktlint
        https://raw.githubusercontent.com/shyiko/ktlint/${pkgver}/LICENSE
        ktlint-${pkgver}.asc::https://github.com/shyiko/ktlint/releases/download/${pkgver}/ktlint.asc)
sha256sums=('2b8487d635977bd844ea22478c457f008fc6732a4257640de2add5e54f23d087'
            '94fcaa8988fceec75f68ae8b31bb51676e4afc2534072b6e634a986700804f94'
            'SKIP')

package() {
  cd "${srcdir}"

  install -D -m755 ktlint-${pkgver} "${pkgdir}/usr/bin/ktlint"
  install -D -m644 LICENSE "${pkgdir}/usr/share/license/ktlint/LICENSE"
}

