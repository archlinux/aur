# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >

_themeid=1475492266
_themename=hooli
_themeurl=1102901
_themeurlfull=https://dl.opendesktop.org/api/files/download/id/1475492266/Hooli%20Theme%20Final%20version.zip

pkgname=gtk-theme-${_themename}
pkgver=5
pkgrel=1
pkgdesc="gtk theme inspired by the name of Silicon Valley American teledrama."
arch=('any')
url="https://www.gnome-look.org/p/${_themeurl}/"
license=('CC by SA3')
depends=('gtk3>3.14')
source=(Hooli-master.zip::https://dl.opendesktop.org/api/files/download?id=${_themeid})
sha256sums=('3c4fc526eb35ceaaec400b7532f6857b5a518a08c446e28a1f86c6893bcf4f38')

package() {
  cd "Hooli Theme Final version/Hooli"
  find . -type f -not -name .gitignore -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/${_themename}/{}" \;
}
