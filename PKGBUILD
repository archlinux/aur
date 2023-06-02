pkgname=simple-and-soft-cursor
pkgver=0.2
pkgrel=8
pkgdesc='A simple and soft X cursor theme'
arch=(any)
license=(GPL)
source=($pkgname.tar.xz::https://github.com/red-magic/dotfiles/raw/master/extra/themes/cursor-themes/$pkgname.tar.xz)
b2sums=(519d7e3bacf9e43fba67bca8c0911029522d13308f6994634514b80799ea9544c9a3d5af0805b27316ada9d6590c8217eca1aba34ddffa525a1705d853e01915)

package() {
	install -dm 755 $pkgdir/usr/share/icons/$pkgname/cursors
	cp -d $pkgname/cursors/* $pkgdir/usr/share/icons/$pkgname/cursors
	chmod 644 $pkgdir/usr/share/icons/$pkgname/cursors/*
	install -Dm 644 $pkgname/index.theme $pkgdir/usr/share/icons/$pkgname/index.theme
}
