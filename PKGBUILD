pkgname=windows-10-cursor
pkgver=2.0
pkgrel=1
pkgdesc='A Windows 10 light and dark cursor theme'
arch=(any)
options=(!debug)
source=($pkgname.tar.gz::https://github.com/red-magic/cursor-themes/releases/download/$pkgver/$pkgname.tar.gz)
b2sums=(c2145e28061d044ebe0839de7a88bfaa76424409f9632bfee84ece547d652a2da8c377465453a3d97d770efe3f4ebc2c4796b56d429403e893d9bed803a9a742)

package() {
	install -Dm 644 $pkgname/Windows-10/*.* -t $pkgdir/usr/share/icons/Windows-10
	install -Dm 644 $pkgname/Windows-10/cursors/* -t $pkgdir/usr/share/icons/Windows-10/cursors

	install -Dm 644 $pkgname/Windows-10-Alt-Light/*.* -t $pkgdir/usr/share/icons/Windows-10-Alt-Light
	install -Dm 644 $pkgname/Windows-10-Alt-Light/cursors/* -t $pkgdir/usr/share/icons/Windows-10-Alt-Light/cursors

	install -Dm 644 $pkgname/Windows-10-Alt-Dark/*.* -t $pkgdir/usr/share/icons/Windows-10-Alt-Dark
	install -Dm 644 $pkgname/Windows-10-Alt-Dark/cursors/* -t $pkgdir/usr/share/icons/Windows-10-Alt-Dark/cursors
}
