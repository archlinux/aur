# Maintainer: David Población Criado <davidpblcrd@protonmail.com>
pkgname=nasa-wallpaper
pkgver=1.2
pkgrel=1
pkgdesc="Change your desktop background with a NASA image. You can set an image from both the APOD (Astronomical Picture of the Day) and the NASA Image Library."
arch=('any')
url="https://davidpob99.github.io/nasa-wallpaper/"
license=('Apache')
depends=('jq' 'curl' 'wget')
source=("https://github.com/davidpob99/nasa-wallpaper/archive/1.2.tar.gz")
md5sums=('1a8b3085273656075e8b320a8d30fc53')

package() {
	cd "$pkgbase-$pkgver"		
	install -Dm755 nasa-wallpaper /$pkgdir/usr/bin/nasa-wallpaper
	install -Dm755 nasa-wallpaper.1.gz /$pkgdir/usr/share/man/man1/nasa-wallpaper.1.gz
}
