# Maintainer: Anchorman <soulanchor at protonmail dot com>
pkgname=soulanchor
pkgver=0.8.0
pkgrel=1
pkgdesc="X11 Bible tool"
arch=('x86_64')
url="https://www.dropbox.com/sh/jhuutnchr7pxru3/AAA7rtTic8LdeUFTKEtsW2hPa?dl=0"
license=('custom:soulanchor')
depends=(qt5-base qt5-multimedia)
source=("https://www.dropbox.com/s/zaqi0bnhhk682f3/$pkgname-$pkgver.tar.gz")
md5sums=("90dc5bf9f876b6d53724efdb5bdedb66")
Name=SoulAnchor

package() {
	cd "$srcdir/$pkgname-$pkgver"
	cp -a --no-preserve=ownership usr "$pkgdir/"
	install -Dm644 usr/share/soulanchor/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
