# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=graphwalker-cli
pkgver=4.0.1
pkgrel=1
pkgdesc="Open-source model-based testing tool - cli"
arch=('any')
url="http://graphwalker.github.io/"
license=('MIT')
depends=('java-environment-common')
optdepends=('maven')
source=("https://github.com/GraphWalker/graphwalker-project/releases/download/${pkgver}/${pkgname}-${pkgver}.jar"
        "graphwalker-cli")
sha256sums=('f5d1b1464d03fc25ded57ce225f0684c65df5d5bac8299417f9f1d82bfa390a5'
            '233c514a8e0c8e553358703f555dd4ca2cfd298e458aed4c3257628c928460f6')

package() {
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
