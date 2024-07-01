# Maintainer: Iztech LLC <iztech@iztech.ru>
pkgname=kt6-bin
orgname=Iztech
pkgver=1.3.3
pkgrel=1
pkgdesc="Программа для управления калибраторами температуры серии КТ-6 производства ООО ИзТех"
url="https://www.iztech.ru"
license=(custom)
depends=("qt5-base" "qt5-multimedia" "qt5-svg" "qt5-serialport" "qwt" "sqlite")
arch=("x86_64")
options=("strip" "!debug")
source=("$url/content/files/app/$pkgname-linux-x86_64.tar.gz")
md5sums=("bc6deecde60f537eec732e2ed09a109b")

package() {
	install -Dm755 "$srcdir/kt6" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/resource/LICENSE" "$pkgdir/usr/share/licenses/$orgname/$pkgname/LICENSE"
	install -Dm644 "$srcdir/resource/COPYING.LESSER" "$pkgdir/usr/share/licenses/$orgname/$pkgname/COPYING.LESSER"
	install -Dm644 "$srcdir/resource/kt6.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/resource/kt6.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}