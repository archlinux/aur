# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname='numix-holo-themes'
pkgver=0.4.1
pkgrel=1
pkgdesc='A fork of Numix, but uses Android blue instead of red, hence the name'
arch=('any')
url='https://www.xfce-look.org/p/1016603'
license=('GPL')
source=('https://dl.opendesktop.org/api/files/download/id/1462388433/159304-NumixHolo.7z')
sha256sums=('809f606415356bb0ce7caa30e94e0342e9e147d6c6f874111f8f200a04b8ae6c')

package() {
  mkdir -p "$pkgdir/usr/share/themes/NumixHolo"

  cp -r \
    "$srcdir/NumixHolo/"{gtk-2.0,gtk-3.0,index.theme,xfce-notify-4.0,xfwm4} \
    "$pkgdir/usr/share/themes/NumixHolo"
}
