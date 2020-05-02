# Maintainer: TheBitStick <the at bitstick dot rip>
pkgname=xdg-break
pkgver=0.1.1
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
sha512sums=('7fa90f89ddf664f0929953be1aea457f05159781b13ef27b015fe9a479a93d69c0355ef2cbc2f019f557ab1e6f6eaf0b8952185b80de0126e4806573c4445960')

package() {
	cd "$pkgname-$pkgver"

	install -D -t "$pkgdir/usr/bin" "xdg-break.fish"
	install -D -t "$pkgdir/usr/share/applications" "xdg-break.desktop"
	mv "$pkgdir/usr/bin/xdg-break.fish" "$pkgdir/usr/bin/xdg-break"
} 
