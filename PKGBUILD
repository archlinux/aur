# Maintainer: wenLiangcan <boxeed at gmail dot com>

_pkgname=dunkel
pkgname="fcitx-skin-${_pkgname}"
pkgver=0.1
pkgrel=1
pkgdesc="Dark fcitx theme. Based on margueritesu's Default theme."
arch=("any")
url="http://kde-look.org/content/show.php/Dunkel?content=160618"
license=('GPL')
depends=('fcitx>=4.2.6')
source=("${_pkgname}.fskin"::'http://kde-look.org/CONTENT/content-files/160618-Dunkel.fskin')
md5sums=('866d787e7d53ab7b9fe3de44ee5ae0d7')

build() {
    tar xzvf "${_pkgname}.fskin"
}

package() {
    install -dm755 "${pkgdir}/usr/share/fcitx/skin"
    mv Dunkel "${pkgdir}/usr/share/fcitx/skin/${_pkgname}"
}
