pkgname=simple-and-soft-cursor
pkgver=0.2
pkgrel=8
pkgdesc='A simple and soft X cursor theme'
arch=(any)
license=(GPL)
source=(https://github.com/red-magic/dotfiles/raw/master/themes/cursor-themes/$pkgname.tar.xz)
sha256sums=(f9ced93e1a2351b0449e8fac13139982ed2919e2c9eb1193d0ad7a02c7393d2c)

package() {
	install -dm 755 $pkgdir/usr/share/icons/$pkgname/cursors
	cp -d $pkgname/cursors/* $pkgdir/usr/share/icons/$pkgname/cursors
	chmod 644 $pkgdir/usr/share/icons/$pkgname/cursors/*
	install -Dm 644 $pkgname/index.theme $pkgdir/usr/share/icons/$pkgname/index.theme
}
