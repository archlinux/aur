# Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=ktlint
pkgver=0.31.0
pkgrel=1
pkgdesc="An anti-bikeshedding Kotlin linter with built-in formatter"
arch=('any')
url="https://ktlint.github.io/"
license=('CUSTOM: MIT')
depends=('java-runtime')
validpgpkeys=(160A7A9CF46221A56B06AD64461A804F2609FD89)
source=(ktlint-${pkgver}::https://github.com/shyiko/ktlint/releases/download/${pkgver}/ktlint
        https://raw.githubusercontent.com/shyiko/ktlint/${pkgver}/LICENSE
        ktlint-${pkgver}.asc::https://github.com/shyiko/ktlint/releases/download/${pkgver}/ktlint.asc)
sha256sums=('2ad9b15eb0a13ba151e07d7acc57a0980e50a869200b1348e14310683775172f'
            '94fcaa8988fceec75f68ae8b31bb51676e4afc2534072b6e634a986700804f94'
            'SKIP')

package() {
  cd "${srcdir}"

  install -D -m755 ktlint-${pkgver} "${pkgdir}/usr/bin/ktlint"
  install -D -m644 LICENSE "${pkgdir}/usr/share/license/ktlint/LICENSE"
}

