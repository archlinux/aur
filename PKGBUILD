# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=graphwalker
pkgver=3.4.0
pkgrel=1
pkgdesc="Model-Based testing tool built in Java"
arch=('any')
url="http://graphwalker.org/"
license=('MIT')
depends=('java-environment-common')
optdepends=('maven')
source=("http://graphwalker.github.io/content/archive/${pkgname}-cli-${pkgver}.jar"
        "graphwalker")
sha256sums=('57968b6e4e430703af34a6b3e0f85ac3fa16a5b98ba4df82e870106f65eddafb'
            '524a9bdd1155e99aaf17f0317d303cdcfda3a1fac9ae8efe8da17348569a368b')

package() {
  install -Dm 644 "${srcdir}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
