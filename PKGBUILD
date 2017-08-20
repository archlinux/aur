# Maintainer: David Población Criado <david.pobcri@educa.jcyl.es>
pkgname=nasa-wallpaper
pkgver=1.1
pkgrel=1
pkgdesc="Change your desktop background with a NASA image. You can set an image from both the APOD (Astronomical Picture of the Day) and the NASA Image Library."
arch=('any')
url="https://davidpob99.github.io/nasa-wallpaper/"
license=('Apache')
depends=('jq' 'curl' 'wget')
source=("https://github.com/davidpob99/nasa-wallpaper/archive/1.1.tar.gz")
md5sums=('588ed2c191fc877e2ef7acacabd9f365')

package() {
	cd "$pkgbase-$pkgver"		
	install -Dm755 nasa-wallpaper /$pkgdir/usr/bin/nasa-wallpaper
	install -Dm755 nasa-wallpaper.1.gz /$pkgdir/usr/share/man/man1/nasa-wallpaper.1.gz
}