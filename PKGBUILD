# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=jgraphx
pkgver=3.5.1.1
pkgrel=1
pkgdesc="Open source graph drawing component."
arch=('any')
url="https://github.com/jgraph/jgraphx"
license=('BSD')
depends=('java-runtime')
source=( "${pkgname}-v${pkgver}.tar.gz::https://github.com/jgraph/jgraphx/archive/v${pkgver}.tar.gz"
)
sha256sums=('96ec1069ba563b32601c6cbf8b2b55c2763f4d958c114b9a400005f69744e048')

package() {
  cd "${srcdir}/jgraphx-${pkgver}"
	install -Dm644 "license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
	install -Dm644 "lib/jgraphx.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}

# vim:set ts=2 sw=2 et:
