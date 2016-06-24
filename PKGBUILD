# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >

_themeid=1466765754
_themename=hooli
_themeurl=1102901

pkgname=gtk-theme-${_themename}
pkgver=4
pkgrel=0
pkgdesc="gtk theme inspired by the name of Silicon Valley American teledrama."
arch=('any')
url="https://www.gnome-look.org/p/${_themeurl}/"
license=('CC by SA3')
depends=('gtk3>3.14')
source=(Hooli-master.zip::https://dl.opendesktop.org/api/files/download?id=${_themeid})
sha256sums=('e7509267f1ec402e7bcd0d1d142816fb67a5e5a4a6d161ae6e1ada57d6f33da5')

package() {
  cd "Hooli-master v4/Hooli"
  find . -type f -not -name .gitignore -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/${_themename}/{}" \;
}
