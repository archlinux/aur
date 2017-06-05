# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=numix-square-icon-theme
pkgver=17.04.05
_pkgver=17-04-05
_gitname=numix-icon-theme-square
pkgrel=1
pkgdesc="A square-ish shaped icon theme from the  Numix Project"
arch=('any')
url='https://numixproject.org/'
license=('GPL3')
depends=('numix-icon-theme-git')
conflicts=("numix-square-icon-theme-git")
source=("https://github.com/numixproject/${_gitname}/archive/${_pkgver}.tar.gz")
sha256sums=('491d6383edfe5748b798306424942dc90b8bf0f3befc7dde3662a67130dca9dc')
options=('!strip')

package() {
  install -dm755 "$srcdir/${_gitname}-${_pkgver}/" "$pkgdir/usr/share/icons/"
  cp -r  "$srcdir/${_gitname}-${_pkgver}/Numix-Square" "$pkgdir/usr/share/icons/"
  cp -r "$srcdir/${_gitname}-${_pkgver}/Numix-Square-Light" "$pkgdir/usr/share/icons/"
  install -Dm644 "$srcdir/${_gitname}-${_pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
