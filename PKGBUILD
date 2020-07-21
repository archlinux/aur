# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=otf-authentic-sans-git
pkgver=v1.1.r2.gfb3a85c
pkgrel=1
pkgdesc="A typeface intended for situations where Oriya Sangam MN seems too sophisticated and LiHei Pro too vulgar, or vice versa."
arch=(any)
url="https://authentic.website/sans.html"
license=(WTFPL)
source=("https://github.com/desmondhwong/AUTHENTIC-Sans/archive/fb3a85c7f936ade83c75043aedc905f799949aee.tar.gz")
sha256sums=("a6a8a21d47e36ec5cc761e4eae3fe3bb68b5fd541f3ff49ac1b64ddf6c48fb47")

package() {
	cd AUTHENTIC-Sans-fb3a85c7f936ade83c75043aedc905f799949aee
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" wtfpl.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/authentic-sans-git" *.otf
}
