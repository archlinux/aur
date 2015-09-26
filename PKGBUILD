# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
pkgname=ttf-noto-emoji
pkgver=2015.09.26
pkgrel=1
pkgdesc="Unicode Emoji font"
arch=('any')
url="http://www.google.com/get/noto"
license=('apache')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("https://noto-website-2.storage.googleapis.com/pkgs/NotoEmoji-unhinted.zip")
md5sums=('4a6d9ed18f1490a4817ca3d2678a471a')

package() {
	install -d "$pkgdir/usr/share/fonts/TTF"
	install -m644 "$srcdir/NotoEmoji-Regular.ttf" "$pkgdir/usr/share/fonts/TTF"
}
