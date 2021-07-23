# Maintainer: ItzSelenux <zariepcommunication@gmail.com>
pkgname=rofi-mint-themes
pkgver=1.0
pkgrel=1
pkgdesc="Mint-Y based themes for Rofi"
url="https://github.com/ItzSelenux/rofi-mint-themes"
arch=('any')
license=("GPL3")
depends=('rofi')
provides=('rofi-mint-themes')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b7e6aaf6222709fdff22a2ae00cddc3f0cb6181942f8b9c88348476cb4bf1c75')
 
package() {
  cd "$pkgname-$pkgver/themes/"
  install -Dm755 "Mint-Y-Dark-Aqua.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Dark-Blue.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Dark-Brown.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Dark-Green.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Dark-Grey.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Dark-Orange.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Dark-Pink.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Dark-Purple.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Dark-Red.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Dark-Sand.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Dark-Teal.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Light-Aqua.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Light-Blue.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Light-Brown.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Light-Green.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Light-Grey.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Light-Orange.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Light-Pink.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Light-Purple.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Light-Red.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Light-Sand.rasi" -t "$pkgdir/usr/share/rofi/themes"
  install -Dm755 "Mint-Y-Light-Teal.rasi" -t "$pkgdir/usr/share/rofi/themes"
}
