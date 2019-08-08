# Maintainer: Iztech LLC <iztech@iztech.ru>
pkgname=mit30
orgname=Iztech
pkgver=1.0.9
pkgrel=1
pkgdesc="Программа для управления измерителями температуры серии МИТ-30 производства ООО ИзТех"
url="https://www.iztech.ru"
license=(custom)
depends=("qt5-base" "qt5-multimedia" "qt5-svg" "qt5-serialport" "qwt" "sqlite")
arch=('x86_64')
options=('strip')
source=("$url/content/files/$pkgname-$pkgver-x86_64.tar.gz")
md5sums=('d638e6549c9e783598d8a4871642adde')

package() {
  install -Dm755 "$srcdir/mit30" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/resource/LICENSE" "$pkgdir/usr/share/licenses/$orgname/$pkgname/LICENSE"
  install -Dm644 "$srcdir/resource/COPYING.LESSER" "$pkgdir/usr/share/licenses/$orgname/$pkgname/COPYING.LESSER"
  install -Dm644 "$srcdir/resource/template/sqlite.db" "$pkgdir/usr/share/$orgname/$pkgname/template/sqlite.db"
  install -Dm644 "$srcdir/resource/mit30.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/resource/mit30.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"

}
