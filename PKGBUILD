# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >

_themeid=1475492266
_themename=hooli
_themeurl=1102901
_themegit=Hooli-theme

pkgname=gtk-theme-hooli
pkgver=7
pkgrel=1
pkgdesc="gtk theme inspired by the name of Silicon Valley American teledrama."
arch=('any')
url="https://www.gnome-look.org/p/${_themeurl}/"
license=('CC by SA3')
source=(git+https://github.com/USBA/Hooli-theme.git)
sha256sums=('SKIP')
depends=('gtk3>3.14')

package() {
  cd "${_themegit}"
  find . -type f -not -name .gitignore -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/${_themename}/{}" \;
}
