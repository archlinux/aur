# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="knock-bin"
pkgver=79
pkgrel=1
pkgdesc="Convert ACSM files to PDF/EPUBs with one command on Linux"
arch=('x86_64')
url="https://github.com/BentonEdmondson/knock"
license=('GPL3')
source_x86_64=("knock::$url/releases/download/$pkgver/knock.linux.x86_64")
b2sums_x86_64=('8117834a773bbb91d6b870624a7ba37c9f089c8df45430762b842584302d3c70fa9a0b82a88b5f33107e896703ea02a32904e5af4b5eb9e7ca24e1436f2637e5')
package() {
	install -Dm755 ./knock "$pkgdir/usr/bin/knock"
}
