# Maintainer: TheBitStick <the at bitstick dot rip>
pkgname=tsubasa
pkgver=0.1.3
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
sha512sums=('3e682bd1626b1e4df72ec90a2a00799c274c4ebe0d548d6ae5805ffbfb295f7957813f496bf83c6ddc9e3cc4dcaad814517bcf1c8dbe8b1ec22299a7dc894149')

package() {
	cd "$pkgname-$pkgver"

	install -D -t "$pkgdir/usr/bin" "tsubasa.fish"
	install -D -t "$pkgdir/usr/share/applications" "tsubasa.desktop"
	mv "$pkgdir/usr/bin/tsubasa.fish" "$pkgdir/usr/bin/tsubasa"
} 
