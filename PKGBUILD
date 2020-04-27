# Maintainer: TheBitStick <the at bitstick dot rip>
pkgname=xdg-break
pkgver=0.1.0
pkgrel=1
pkgdesc="Script that sends a notification to remind you to take a break"
arch=('any')
url="https://github.com/thebitstick/xdg-break"
license=('GPL3')
depends=('fish' 'libnotify')
makedepends=('git')
provides=('xdg-break')
conflicts=('xdg-break')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a5681072a7c1a2aa156feb874c8f7ce8459b4fe598ea0abfe98b49b6285abb943708474fbb7de60b2b0ad7ef67310f1bfc65e149c97e968032c1799517735428')

package() {
	cd "$pkgname-$pkgver"

	install -D -t "$pkgdir/usr/bin" "xdg-break.fish"
	install -D -t "$pkgdir/usr/share/applications" "xdg-break.desktop"
	mv "$pkgdir/usr/bin/xdg-break.fish" "$pkgdir/usr/bin/xdg-break"
} 
