# Maintainer: KScott <kscott.db@gmail.com>

pkgname=ttf-oldschool-pc-fonts
pkgver=1.0
pkgrel=1
pkgdesc="The Ultimate Oldschool PC Font Pack - The world's biggest collection of classic text mode fonts, system fonts and BIOS fonts from DOS-era IBM PCs and compatibles"
arch=(any)
url="https://int10h.org/oldschool-pc-fonts/"
license=('custom:CC BY-SA 4.0')

source=("https://int10h.org/oldschool-pc-fonts/download/ultimate_oldschool_pc_font_pack_v${pkgver}.zip")

sha256sums=("7666cf23176e34ea03a218b5c1500f4ad729d97150ab7bdb7cf2adf4c99a9a7a")

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE.TXT"
	
	mkdir "$pkgdir/usr/share/fonts"
	mkdir "$pkgdir/usr/share/fonts/$pkgname"
	mkdir "$pkgdir/usr/share/fonts/$pkgname/Px437"
	mkdir "$pkgdir/usr/share/fonts/$pkgname/PxPlus"
	cp -r "$srcdir/Px437 (TrueType - DOS charset)" "$pkgdir/usr/share/fonts/$pkgname/Px437"
	cp -r "$srcdir/PxPlus (TrueType - extended charset)" "$pkgdir/usr/share/fonts/$pkgname/PxPlus"
}
