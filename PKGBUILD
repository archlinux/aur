# Maintainer: Jeff Farthing <jeff at jfarthing dot com>

pkgname=plymouth-theme-arch-glow
pkgver=1.0
pkgrel=2
pkgdesc="This is a simple Plymouth theme displaying the Arch Linux logo."
arch=('any')
url="http://gnome-look.org/content/show.php/Arch+Linux+Glow?content=167536"
license=('CCPL:cc-by-3.0')
depends=('plymouth')
source=("$pkgname-$pkgver.zip::http://gnome-look.org/CONTENT/content-files/167536-Arch%20Linux%20Plymouth%20theme.zip")
md5sums=('1881cef05fa9be77cb88f990d70b027a')

package() {
	cd $srcdir/Arch\ Linux\ Plymouth\ theme/arch-glow
	rm Thumbs.db
	mkdir -p $pkgdir/usr/share/plymouth/themes/arch-glow
	install -Dm644 * $pkgdir/usr/share/plymouth/themes/arch-glow
}

