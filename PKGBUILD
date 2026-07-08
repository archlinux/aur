# Maintainer: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
#             Bui Gia Vien (shadichy) <shadichy@blisslabs.org>

pkgname=freemarker
pkgver=2.3.34
pkgrel=1
pkgdesc="a generic tool to generate text output based on templates"
arch=(any)
url=https://freemarker.apache.org/
license=(Apache)
depends=(java-runtime-headless)
makedepends=()
source=("https://downloads.apache.org/freemarker/engine/$pkgver/binaries/apache-freemarker-bin-$pkgver.tgz"{,.asc})
validpgpkeys=(
	13AC2213964ABE1D1C147C0E1939A2520BAB1D90 # Daniel Dekany <ddekany@apache.org>
)
sha256sums=('161a5ccfd9bac09e718d823befdba352d434d450c922886563d9b8d62b9c0448'
	'07b9f0f09fce9dab2e9919f0ef8d76799763cea2ecf328679fa96d8e40a6fcb9')

package() {
	cd $srcdir
	install -Dm644 freemarker.jar $pkgdir/usr/share/java/freemarker/freemarker.jar
}
