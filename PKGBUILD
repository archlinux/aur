pkgname=windows-10-cursor
pkgver=1.1
pkgrel=2
pkgdesc='A Windows 10 light and dark cursor theme'
arch=(any)
source=($pkgname.tar.xz::https://github.com/red-magic/dotfiles/raw/master/extra/themes/cursor-themes/$pkgname.tar.xz)
b2sums=(340372367ff11ecf1e7a544e9ad7640fb7d396047efc7f72f2cff3ce45cf84105845fe569ba7fd96b6faa4a916fc007465d92b01b8846f048b0572e94ad68658)

package() {
	mkdir -p $pkgdir/usr/share/icons
	cp -r $pkgname/{Windows-10-Light,Windows-10-Dark} $pkgdir/usr/share/icons
}
