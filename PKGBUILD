# Maintainer: Snark1994 <sna rk 1994 at google mail dot com> (no spaces)

pkgname=mockito
pkgver=2.2.8
pkgrel=1
pkgdesc="A java mocking framework that lets you write beautiful tests with a clean and simple API"
arch=('any')
url="https://github.com/mockito/mockito"
license=('MIT')
depends=('java-runtime')
source=("https://dl.bintray.com/mockito/maven/org/mockito/mockito-core/${pkgver}/mockito-core-${pkgver}.jar" \
		"LICENSE")
noextract=("mockito-all-${pkgver}.jar")
sha256sums=('ae43d37d26b9100145f098750a2d7bbde2d39d2fd6e419ac72a2c90db29c4d9c'
			'c91362ba4ffbea02d2ed5b7104893d56142479ea58068c95eee17925e25372da')

package() {
	install -D -m644 "${srcdir}/mockito-core-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}.jar"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

