# Maintainer: Anchorman <soulanchor at protonmail dot com>
pkgname=soulanchor
pkgver=0.8.5
pkgrel=1
pkgdesc="X11 Bible tool"
arch=('x86_64')
url="https://github.com/Anchorm/SoulAnchor"
license=('custom:soulanchor')
depends=(qt5-base qt5-multimedia)
source=("https://www.dropbox.com/s/87bbvpsq82xv1nn/$pkgname-$pkgver.tar.gz")
md5sums=("575fc9ca838a8337193f434eee433e81")
Name=SoulAnchor

package() {
	cd "$srcdir/$pkgname-$pkgver"
	cp -a --no-preserve=ownership usr "$pkgdir/"
	install -Dm644 usr/share/soulanchor/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
