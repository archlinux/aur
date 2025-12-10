pkgname=windows-10-cursor
pkgver=1.0
pkgrel=1
pkgdesc='A Windows 10 light and dark cursor theme'
arch=(any)
options=(!debug)
source=($pkgname.tar.gz::https://github.com/red-magic/cursor-themes/releases/download/1.0/$pkgname.tar.gz)
b2sums=(f55cc48109846f7aa60cd9e60581197867061a2650a86c7b9ec2bfedf4cd677b0482a262789daca1ef252e3f043733ccbfe302548d0b5ea2a9729865e2b2358b)

package() {
	install -Dm 644 $pkgname/Windows-10/*.* -t $pkgdir/usr/share/icons/Windows-10
	install -Dm 644 $pkgname/Windows-10/cursors/* -t $pkgdir/usr/share/icons/Windows-10/cursors

	install -Dm 644 $pkgname/Windows-10-Alt-Light/*.* -t $pkgdir/usr/share/icons/Windows-10-Alt-Light
	install -Dm 644 $pkgname/Windows-10-Alt-Light/cursors/* -t $pkgdir/usr/share/icons/Windows-10-Alt-Light/cursors

	install -Dm 644 $pkgname/Windows-10-Alt-Dark/*.* -t $pkgdir/usr/share/icons/Windows-10-Alt-Dark
	install -Dm 644 $pkgname/Windows-10-Alt-Dark/cursors/* -t $pkgdir/usr/share/icons/Windows-10-Alt-Dark/cursors
}
