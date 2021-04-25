# Original packager: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Andrea Girotto echo "naqern.tvebggb@tznvy.pbz" | tr '[a-z]' '[n-za-m]'
pkgname=java-commons-codec
pkgver=1.15
pkgrel=1
pkgdesc='Implementations of common encoders and decoders such as Base64, Hex, Phonetic and URLs'
arch=(any)
url='http://commons.apache.org/codec/'
license=('Apache')
depends=('java-runtime>=7')
source=(http://downloads.apache.org//commons/codec/binaries/commons-codec-${pkgver}-bin.tar.gz)
# source=("http://mirror.ibcp.fr/pub/apache//commons/codec/binaries/commons-codec-${pkgver}-bin.tar.gz")
# http://it.apache.contactlab.it//commons/codec/binaries/commons-codec-1.13-bin.tar.gz
md5sums=('3ed07a9c77bdab5ef9402eb568042c66')

package() {
    install -d -m755 ${pkgdir}/usr/share/java/commons-codec/ || return 1
    install -m644 \
        ${srcdir}/commons-codec-${pkgver}/commons-codec-${pkgver}.jar \
	${pkgdir}/usr/share/java/commons-codec/commons-codec.jar || return 1
}
