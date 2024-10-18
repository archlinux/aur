pkgname=windows-10-cursor
pkgver=1.2
pkgrel=2
pkgdesc='A Windows 10 light and dark cursor theme'
arch=(any)
options=(!debug)
source=($pkgname.tar.xz::https://github.com/red-magic/dotfiles/raw/master/extra/themes/cursor-themes/$pkgname.tar.xz)
b2sums=(9231903999afe7775679d627239c8d7114ec5a5e277bedc1178e9a014f62058cadbec6b922038d335201175625636f10ac69c80b5904a48093a6df2ef528cb2e)

package() {
	install -Dm 644 $pkgname/Windows-10/*.* -t $pkgdir/usr/share/icons/Windows-10
	install -Dm 644 $pkgname/Windows-10/cursors/* -t $pkgdir/usr/share/icons/Windows-10/cursors

	install -Dm 644 $pkgname/Windows-10-Alt-Light/*.* -t $pkgdir/usr/share/icons/Windows-10-Alt-Light
	install -Dm 644 $pkgname/Windows-10-Alt-Light/cursors/* -t $pkgdir/usr/share/icons/Windows-10-Alt-Light/cursors

	install -Dm 644 $pkgname/Windows-10-Alt-Dark/*.* -t $pkgdir/usr/share/icons/Windows-10-Alt-Dark
	install -Dm 644 $pkgname/Windows-10-Alt-Dark/cursors/* -t $pkgdir/usr/share/icons/Windows-10-Alt-Dark/cursors
}
