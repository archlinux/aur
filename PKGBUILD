# Maintainer: wenLiangcan <boxeed at gmail dot com>

_pkgname=new-dark
pkgname="fcitx-skin-${_pkgname}"
pkgver=2.0
pkgrel=1
pkgdesc="Dark fcitx theme."
arch=("any")
url="http://kde-look.org/content/show.php/new+dark?content=159658"
license=('GPL')
depends=('fcitx>=4.2.6')
source=("${_pkgname}.fskin"::'http://kde-look.org/CONTENT/content-files/159658-new-dark.fskin')
md5sums=('ee0b92e266184381358d2b857299fe1f')

build() {
    tar xzvf "${_pkgname}.fskin"
}

package() {
    install -dm755 "${pkgdir}/usr/share/fcitx/skin"
    mv dark "${pkgdir}/usr/share/fcitx/skin/${_pkgname}"
}
