# Original packager: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Andrea Girotto echo "naqern.tvebggb@tznvy.pbz" | tr '[a-z]' '[n-za-m]'
pkgname=java-commons-codec
pkgver=1.10
pkgrel=1
pkgdesc='Implementations of common encoders and decoders such as Base64, Hex, Phonetic and URLs'
arch=(any)
url='http://commons.apache.org/codec/'
license=('Apache')
depends=('java-environment')
source=("http://mirror.ibcp.fr/pub/apache//commons/codec/binaries/commons-codec-${pkgver}-bin.tar.gz")
md5sums=('9b413ef3eae50bdf3da89644fd3cdbe5')

package() {
    install -d -m755 ${pkgdir}/usr/share/java/commons-codec/ || return 1
    install -m644 \
        ${srcdir}/commons-codec-${pkgver}/commons-codec-${pkgver}.jar \
	${pkgdir}/usr/share/java/commons-codec/commons-codec.jar || return 1
}
