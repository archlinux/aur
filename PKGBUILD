pkgname=windows-10-cursor
pkgver=1.2
pkgrel=1
pkgdesc='A Windows 10 light and dark cursor theme'
arch=(any)
options=(!debug)
source=($pkgname.tar.xz::https://github.com/red-magic/dotfiles/raw/master/extra/themes/cursor-themes/$pkgname.tar.xz)
b2sums=(25b033eff202f094221a07d3efb9c2ec55c162cc862df5571e633da4af9c880e468a80692f6e62b51ac2915d0e8b342b49a4903ce08eb7a113589bf04cba2713)

package() {
	install -Dm 644 $pkgname/Windows-10-Light/*.* -t $pkgdir/usr/share/icons/Windows-10-Light
	install -Dm 644 $pkgname/Windows-10-Light/cursors/* -t $pkgdir/usr/share/icons/Windows-10-Light/cursors

	install -Dm 644 $pkgname/Windows-10-Dark/*.* -t $pkgdir/usr/share/icons/Windows-10-Dark
	install -Dm 644 $pkgname/Windows-10-Dark/cursors/* -t $pkgdir/usr/share/icons/Windows-10-Dark/cursors
}
