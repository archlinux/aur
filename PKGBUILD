# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=otf-authentic-sans
pkgver=1.1
pkgrel=1
pkgdesc="A typeface intended for situations where Oriya Sangam MN seems too sophisticated and LiHei Pro too vulgar, or vice versa."
arch=(any)
url="https://authentic.website/sans.html"
license=(OFL)
source=("https://github.com/desmondhwong/AUTHENTIC-Sans/archive/v1.1.tar.gz")
sha256sums=("360bf9ea50fb3110174686fff47a81495da1514841b5f2f7bf3ac4925337e42b")

package() {
	cd AUTHENTIC-Sans-1.1
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/authentic-sans" fonts/desktop/*.otf
}
