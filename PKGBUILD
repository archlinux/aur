# Maintainer: wenLiangcan <boxeed at gmail dot com>

_pkgname=new-default
pkgname="fcitx-skin-${_pkgname}"
pkgver=2.0
pkgrel=1
pkgdesc="Fcitx theme."
arch=("any")
url="http://kde-look.org/content/show.php/new+default?content=159657"
license=('GPL')
depends=('fcitx>=4.2.6')
source=("${_pkgname}.fskin"::'http://kde-look.org/CONTENT/content-files/159657-new-default.fskin')
md5sums=('32d2691a9b92ca39bd84911d76634faf')

build() {
    tar xzvf "${_pkgname}.fskin"
}

package() {
    install -dm755 "${pkgdir}/usr/share/fcitx/skin"
    mv default "${pkgdir}/usr/share/fcitx/skin/${_pkgname}"
}
