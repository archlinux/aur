# Maintainer: Felix Mujkanovic <info@cinecred.com>
pkgname=cinecred
pkgver=1.3.1
pkgrel=1
pkgdesc="Create beautiful film credits without the pain"
arch=('x86_64')
url="https://cinecred.com"
license=('GPL3')
source=("https://repo.loadingbyte.com/repository/maven-public/com/loadingbyte/cinecred\
/$pkgver/cinecred-$pkgver-linux-x86_64.tar.gz")
sha256sums=('69c2c2e35053789c4800d238694fdbf95aa1c8fdf0eb0eadd87841e1c717de20')

package() {
	mkdir -p "$pkgdir/opt/"
	cp -r "$srcdir/cinecred/" "$pkgdir/opt/cinecred/"

	mkdir -p "$pkgdir/usr/share/applications/"
	mv "$pkgdir/opt/cinecred/cinecred.desktop" "$_"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	mv "$pkgdir/opt/cinecred/cinecred.svg" "$_"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
	mv "$pkgdir/opt/cinecred/cinecred.png" "$_"
}
