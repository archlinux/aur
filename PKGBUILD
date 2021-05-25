# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=otf-apfel-grotezk
pkgver=2
pkgrel=1
pkgdesc="Apfel Grotezk is a round and airy sans serif family, inspired by neo–grotesque and geometric typefaces."
arch=(any)
url="http://collletttivo.it"
license=(OFL)
source=("$url/download/ApfelGrotezk-clt.zip")
sha256sums=("0c03484fdd06763599b605b604a06a924e77f6ec4961e7f1c2105f394a693ee4")

package() {
	cd ApfelGrotezk-clt
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/apfel-grotezk" desktop/*.otf
}
