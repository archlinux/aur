# Maintainer: Iztech LLC <iztech@iztech.ru>
pkgname=mit8_30
orgname=Iztech
pkgver=1.1.12
pkgrel=1
pkgdesc="Программа для управления измерителями температуры серии МИТ 8.30 производства ООО ИзТех"
url="https://www.iztech.ru"
license=(custom)
depends=("qt5-base" "qt5-multimedia" "qt5-svg" "qt5-serialport" "qwt" "sqlite")
conflicts=("mit30")
replaces=("mit30")
arch=("x86_64")
options=("strip")
source=("$url/content/files/app/$pkgname-latest-x86_64.tar.gz")
md5sums=("d3997146dc984235c31308d29dbd3faf")

package() {
	install -Dm755 "$srcdir/mit8_30" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/resource/LICENSE" "$pkgdir/usr/share/licenses/$orgname/$pkgname/LICENSE"
	install -Dm644 "$srcdir/resource/COPYING.LESSER" "$pkgdir/usr/share/licenses/$orgname/$pkgname/COPYING.LESSER"
	install -Dm644 "$srcdir/resource/template/sqlite.db" "$pkgdir/usr/share/$orgname/$pkgname/template/sqlite.db"
	install -Dm644 "$srcdir/resource/mit8_30.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/resource/mit8_30.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}