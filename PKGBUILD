# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=openapi-generator-cli
pkgver=3.1.0
pkgrel=1
pkgdesc="OpenAPI Generator"
arch=('any')
url="https://openapi-generator.tech/"
license=('MIT')
depends=('java-runtime')
source=("http://central.maven.org/maven2/org/openapitools/$pkgname/$pkgver/$pkgname-$pkgver.jar"
"openapi-generator")
noextract=("$pkgname-$pkgver.jar")
md5sums=('4de086f94ad3400e0e9057d503f44c21'
'687767c7a7a4a20cc1606d4bf956e6da')

package() {
	install -Dm755 openapi-generator "$pkgdir/usr/bin/openapi-generator"
	install -Dm644 $pkgname-$pkgver.jar "$pkgdir/usr/share/java/$pkgname-$pkgver.jar"
}
