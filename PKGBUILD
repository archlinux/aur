# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=graphwalker
pkgver=3.4.2
pkgrel=3
pkgdesc="Model-Based testing tool built in Java"
arch=('any')
url="http://graphwalker.github.io/"
license=('MIT')
depends=('java-environment-common')
optdepends=('maven')
source=("http://graphwalker.github.io/content/archive/${pkgname}-cli-${pkgver}.jar"
        "graphwalker")
sha256sums=('37a18ec00cadcf0a964f37b20d81dbd7e2e61ce6d8d55bea7e61c4ecad6ea096'
            '524a9bdd1155e99aaf17f0317d303cdcfda3a1fac9ae8efe8da17348569a368b')

package() {
  install -Dm 644 "${srcdir}/${pkgname}-cli-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
