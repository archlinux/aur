pkgname=simple-and-soft-cursor
pkgver=0.2
pkgrel=9
pkgdesc='A simple and soft X cursor theme'
arch=(any)
options=(!debug)
source=($pkgname.tar.xz::https://github.com/red-magic/dotfiles/raw/master/extra/themes/cursor-themes/$pkgname.tar.xz)
b2sums=(8f181b2f8bbf914d5a35899d6c91c375196af53d91bce46930710bb625f90f1ac237305f903a419a2104527468af9454e88edcfcba564a5b279e345f59036d89)

package() {
	install -Dm 644 $pkgname/cursors/* -t $pkgdir/usr/share/icons/$pkgname/cursors
	install -Dm 644 $pkgname/index.theme -t $pkgdir/usr/share/icons/$pkgname
}
