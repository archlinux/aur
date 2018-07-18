# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=openapi-generator-cli
pkgver=3.1.1
pkgrel=2
pkgdesc="OpenAPI Generator"
arch=('any')
url="https://openapi-generator.tech/"
license=('MIT')
depends=('java-runtime')
source=("http://central.maven.org/maven2/org/openapitools/$pkgname/$pkgver/$pkgname-$pkgver.jar"
"openapi-generator-cli")
noextract=("$pkgname-$pkgver.jar")
md5sums=('e59142159b45e5f8c5619b20e3408b6c'
'9795786695496120e7c8becb2f6a5e99')

package() {
	install -Dm755 openapi-generator-cli "$pkgdir/usr/bin/openapi-generator-cli"
	install -Dm644 $pkgname-$pkgver.jar "$pkgdir/usr/share/java/$pkgname-$pkgver.jar"
}
