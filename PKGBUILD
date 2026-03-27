# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>
# Co-Maintainer: Melroy van den Berg <melroy at melroy dot org>
pkgname=winegui-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="A user-friendly WINE graphical interface"
arch=('x86_64')
url="https://gitlab.melroy.org/melroy/winegui"
license=('AGPL3')
depends=(
	'gtkmm-4.0'
	'cabextract' # used by winetricks
	'unzip'
	'p7zip'
	'wget' # to download winetricks latest release
	'wine'
	'zenity' # used by winetricks
)
conflicts=('winegui')
provides=('winegui')
source=("$pkgname-$pkgver.tar.gz::https://winegui.melroy.org/downloads/WineGUI-v$pkgver.tar.gz")
md5sums=('865a010b29be4c4a3228c7f32863efca')

package() {
	mkdir $pkgdir/usr
	mv WineGUI-v$pkgver/* "$pkgdir/usr/"
}
