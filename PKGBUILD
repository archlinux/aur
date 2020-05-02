# Maintainer: TheBitStick <the at bitstick dot rip>
pkgname=tsubasa
pkgver=0.1.4
pkgrel=1
pkgdesc="Script for sharing screenshots and/or status updates"
arch=('any')
url="https://github.com/thebitstick/tsubasa"
license=('GPL3')
depends=('fish' 'gnome-screenshot' 'zenity' 'toot')
makedepends=('git')
provides=('tsubasa')
conflicts=('tsubasa')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('27135bc4715c85ca21a6daa7f2bee2f330196501632c6dc7250a05bd4e17f9b065f9d4f672c367aea41ff5b9adb392ad78a3a2988934a05b9a838cf7f62f2e7d')

package() {
	cd "$pkgname-$pkgver"

	install -D -t "$pkgdir/usr/bin" "tsubasa.fish"
	install -D -t "$pkgdir/usr/share/applications" "tsubasa.desktop"
	mv "$pkgdir/usr/bin/tsubasa.fish" "$pkgdir/usr/bin/tsubasa"
} 
