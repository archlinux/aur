# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=graphwalker-studio
pkgver=4.0.1
pkgrel=1
pkgdesc="Open-source model-based testing tool - editor"
arch=('any')
url="http://graphwalker.github.io/"
license=('MIT')
depends=('java-environment-common')
optdepends=('maven')
source=("https://github.com/GraphWalker/graphwalker-project/releases/download/${pkgver}/${pkgname}-${pkgver}.jar"
        "graphwalker-studio")
sha256sums=('d1328eee40e7fe9b6f9cca661b7684362b2ffd7b4c73f0c6b50ff99ddfb19ef4'
            'daa5560702b5249784e9c4c1b6ca456b0476282974fda74d68b9f000a74d7418')

package() {
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
