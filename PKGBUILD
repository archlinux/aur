# Maintainer: Konstantin Kogan <kostyalamer@yandex.ru>
# Contributor: Konstantin Kogan <kostyalamer@yandex.ru>
pkgname=icewm-themes-new
pkgver=1.0
pkgrel=1
pkgdesc="icewm themes"
arch=('any')
license=("GPL")
url=https://www.opendesktop.org/u/ren-cs/
depends=(icewm)
source=("http://altlinuxclub.ru/arhiv/icewm-themes-new_$pkgver.tar.gz")
md5sums=('daba215a881ec7f3ada975e89906f289')

package() {
  cd "$srcdir"/icewm-themes-new_$pkgver
  mkdir -p "$pkgdir/usr/share/icewm/themes"
  cp -r "$srcdir"/icewm-themes-new_$pkgver/* "$pkgdir"/usr/share/icewm/themes/
}
