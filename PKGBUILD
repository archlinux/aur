# Maintainer: TheBitStick <the at bitstick dot rip>
pkgname=xdg-break
pkgver=0.0.1
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
sha512sums=('df92394272bb11f65c14d2c5dfd703ca5d0f8359e0290081b1c50e8d6ce2f378d9e8eaf80fb2a455713ab97659d551abad540034bcc9558a1f06bdd6b496e946')

package() {
	cd "$pkgname-$pkgver"

	install -D -t "$pkgdir/usr/bin" "xdg-break.fish"
	mv "$pkgdir/usr/bin/xdg-break.fish" "$pkgdir/usr/bin/xdg-break"
} 
