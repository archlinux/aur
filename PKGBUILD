# Contributor: Chocopwowwa <chocopowwwa@gmail.com>
# Contributor: Rafed Ramzi <rafedramzi@gmail.com>

pkgname=sweet-gtk-theme-dark
_pkgname=Sweet-Dark
pkgver=2.0.r23.5b53ee2
pkgrel=1
pkgdesc="Light and dark colorful Gtk3.20+ theme"
arch=('any')
url='https://github.com/EliverLara/Sweet'
license=('GPL3')
conflicts=('sweet-theme-dark')
replaces=('sweet-theme-dark')
source=($pkgname-$pkgver.tar.gz::$url/archive/5b53ee233aae437938ab414ae5dcaa79170179be.tar.gz)
b2sums=('df1fa4efd8cad1a9be2b04173249f0f5668d2f9a77ab054f685d9d97cd391a05fba7acd7b2526c4815c9ddc2a3bf374639515044c4acedb1ff14e61e4e17d13b')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/themes/"
}
