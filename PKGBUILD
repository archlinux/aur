# Maintainer: Iztech LLC <iztech@iztech.ru>
pkgname=kt6
orgname=Iztech
pkgver=1.0.7
pkgrel=1
pkgdesc="Программа для управления калибраторами температуры серии КТ-6 производства ООО ИзТех"
url="https://www.iztech.ru"
license=(custom)
depends=("qt5-base" "qt5-multimedia" "qt5-svg" "qt5-serialport" "qwt" "sqlite")
arch=("x86_64")
options=("strip")
source=("$url/content/files/app/$pkgname-latest-x86_64.tar.gz")
md5sums=("beb301fe25e3c6217a7c45a612bf5b13")

package() {
	install -Dm755 "$srcdir/kt6" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/resource/LICENSE" "$pkgdir/usr/share/licenses/$orgname/$pkgname/LICENSE"
	install -Dm644 "$srcdir/resource/COPYING.LESSER" "$pkgdir/usr/share/licenses/$orgname/$pkgname/COPYING.LESSER"
	install -Dm644 "$srcdir/resource/template/sqlite.db" "$pkgdir/usr/share/$orgname/$pkgname/template/sqlite.db"
	install -Dm644 "$srcdir/resource/kt6.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/resource/kt6.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}