# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=otf-apfel-grotezk
pkgver=1
pkgrel=1
pkgdesc="Apfel Grotezk is a round and airy sans serif family, inspired by neo–grotesque and geometric typefaces."
arch=(any)
url="http://collletttivo.it"
license=(OFL)
source=("$url/assets/download/apfelGrotezk.zip")
sha256sums=("33392d45666fd2c9d36cb75ea14514f486929777c97c1735b4f422c027685d0b")

package() {
	cd apfelGrotezk
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/apfel-grotezk" *.otf
}
