# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=numix-square-icon-theme
pkgver=17.28.21
_pkgver=17-08-21
_gitname=numix-icon-theme-square
pkgrel=1
pkgdesc="A square-ish shaped icon theme from the  Numix Project"
arch=('any')
url='https://numixproject.org/'
license=('GPL3')
depends=('numix-icon-theme-git')
conflicts=("numix-square-icon-theme-git")
source=("https://github.com/numixproject/${_gitname}/archive/${_pkgver}.tar.gz")
sha256sums=('2f637c201f8460f4cc8c25f83477492e4f427b14b1358401784ca746f999eb4b')
options=('!strip')

package() {
  install -dm755 "$srcdir/${_gitname}-${_pkgver}/" "$pkgdir/usr/share/icons/"
  cp -r  "$srcdir/${_gitname}-${_pkgver}/Numix-Square" "$pkgdir/usr/share/icons/"
  cp -r "$srcdir/${_gitname}-${_pkgver}/Numix-Square-Light" "$pkgdir/usr/share/icons/"
  install -Dm644 "$srcdir/${_gitname}-${_pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
