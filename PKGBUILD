# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>
pkgname=numix-square-icon-theme
pkgver=17.09.13
_pkgver=17-09-13
_gitname=numix-icon-theme-square
pkgrel=1
pkgdesc="A square-ish shaped icon theme from the  Numix Project"
arch=('any')
url='https://numixproject.org/'
license=('GPL3')
depends=('numix-icon-theme-git')
conflicts=("numix-square-icon-theme-git")
source=("https://github.com/numixproject/${_gitname}/archive/${_pkgver}.tar.gz")
sha256sums=('a246272c3f9f8a42129474f02bf433498bbdb5b2b0315d33f871ca239345191d')
options=('!strip')

package() {
  install -dm755 "${srcdir}/${_gitname}-${_pkgver}/" "${pkgdir}/usr/share/icons/"
  cp -r  "${srcdir}/${_gitname}-${_pkgver}/Numix-Square" "${pkgdir}/usr/share/icons/"
  cp -r "${srcdir}/${_gitname}-${_pkgver}/Numix-Square-Light" "${pkgdir}/usr/share/icons/"
  install -Dm644 "${srcdir}/${_gitname}-${_pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
