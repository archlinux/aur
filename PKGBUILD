# Maintainer: TheBitStick <the at bitstick dot rip>
pkgname=tsubasa
pkgver=0.1.5
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
sha512sums=('d8892757d2cdf51635904a809accdc431e8c3a0e75b1ee996cfd05c12277d5332bcea1ffbdd3dc8a6109dfed0faab9a0f8af689f89716035fd0321dfa08bc3f1')

package() {
	cd "$pkgname-$pkgver"

	install -D -t "$pkgdir/usr/bin" "tsubasa.fish"
	install -D -t "$pkgdir/usr/share/applications" "tsubasa.desktop"
	mv "$pkgdir/usr/bin/tsubasa.fish" "$pkgdir/usr/bin/tsubasa"
} 
