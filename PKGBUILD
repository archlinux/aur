# Maintainer: Snark1994 <sna rk 1994 at google mail dot com> (no spaces)

pkgname=mockito
pkgver=1.10.19
pkgrel=1
pkgdesc="A java mocking framework that lets you write beautiful tests with a clean and simple API"
arch=('any')
url="https://github.com/mockito/mockito"
license=('MIT')
depends=('java-runtime')
source=("https://bintray.com/artifact/download/szczepiq/maven/org/mockito/mockito-all/${pkgver}/mockito-all-${pkgver}.jar" \
		"LICENSE")
noextract=("mockito-all-${pkgver}.jar")
sha256sums=('d1a7a7ef14b3db5c0fc3e0a63a81b374b510afe85add9f7984b97911f4c70605'
            'c91362ba4ffbea02d2ed5b7104893d56142479ea58068c95eee17925e25372da')

package() {
	install -D -m644 "${srcdir}/mockito-all-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}.jar"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

