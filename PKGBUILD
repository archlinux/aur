# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>
pkgname=winegui-bin
pkgver=1.5.2
pkgrel=2
pkgdesc="A user-friendly WINE manager"
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
md5sums=('da49671f22cc2ffb350111fce9c0335d')

package() {
	mkdir $pkgdir/usr
	mv WineGUI-v$pkgver/* "$pkgdir/usr/"
}
