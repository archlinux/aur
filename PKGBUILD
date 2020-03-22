# Maintainer: yurisuki <yurisuki@waifu.club>
pkgname=ios-fonts
pkgver=1
pkgrel=0
pkgdesc="Lazy AUR package that installs ios fonts to linux."
arch=('any')
conflicts=('noto-fonts-emoji')
source=("git+https://github.com/yurisuki/iosfonts.git")
sha512sums=('SKIP')

package() {
	install -Dm 755 "$srcdir/iosfonts/etc/fonts/conf.avail/66-noto-color-emoji.conf" "$pkgdir/etc/fonts/conf.avail/66-noto-color-emoji.conf"
	install -Dm 755 "$srcdir/iosfonts/etc/fonts/conf.d/66-noto-color-emoji.conf" "$pkgdir/etc/fonts/conf.d/66-noto-color-emoji.conf"
	install -Dm 755 "$srcdir/iosfonts/usr/share/fonts/noto/NotoColorEmoji.ttf" "$pkgdir/usr/share/fonts/noto/NotoColorEmoji.ttf"
}
