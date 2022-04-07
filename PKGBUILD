# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-screen-autorotate
pkgver=3
pkgrel=1
pkgdesc="A GNOME extension to auto-rotate screen regardless of touch mode"
arch=("any")
url="https://github.com/kosmospredanie/gnome-shell-extension-screen-autorotate"
license=("GPL")
depends=("gnome-shell" "iio-sensor-proxy")
conflicts=("gnome-shell-extension-screen-autorotate-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('bba9d642f8d8b13730d4b852d5c869ed')

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" \
    && cp -a "$srcdir/$pkgname-$pkgver/screen-autorotate@kosmospredanie.yandex.ru" "$_"
}
