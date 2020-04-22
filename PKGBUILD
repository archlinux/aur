# Maintainer: TheBitStick <the at bitstick dot rip>
pkgname=tsubasa
pkgver=0.1.1
pkgrel=2
pkgdesc="Script for sharing screenshots and/or status updates using ihabunek/toot"
arch=('any')
url="https://github.com/thebitstick/tsubasa"
license=('GPL3')
depends=('fish' 'gnome-screenshot' 'zenity')
makedepends=('git')
provides=('tsubasa')
conflicts=('tsubasa')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('61dfc737f4a2a3737a31323e2a85fabc857a14f2d81f61303ab24a42f38c2d0da637b18381c5d51afbd543901c493f026779719638f109ea6ca2cdf0eb333235')

package() {
	cd "$pkgname-$pkgver"

	install -D -t "$pkgdir/usr/bin" "tsubasa.fish"
	mv "$pkgdir/usr/bin/tsubasa.fish" "$pkgdir/usr/bin/tsubasa"
} 
