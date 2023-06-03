# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>
pkgname=winegui-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="A user-friendly WINE graphical interface"
arch=('x86_64')
url="https://gitlab.melroy.org/melroy/winegui"
license=('AGPL3')
depends=(
	'gtkmm3'
	'cabextract'
	'unzip'
	'p7zip'
	'wget'
	'wine'
	# namcap claims some dependencies aren't needed, but they're infact used on the source-code as a terminal command
)
conflicts=('winegui')
provides=('winegui')
source=("$pkgname-$pkgver.tar.gz::https://winegui.melroy.org/downloads/WineGUI-v$pkgver.tar.gz")
md5sums=('16d0994c171c57a713d081e356534a44')

package() {
	mkdir $pkgdir/usr
	mv WineGUI-v$pkgver/* "$pkgdir/usr/"
}
