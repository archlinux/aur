# Maintainer: wenLiangcan <boxeed at gmail dot com>

_pkgname=opensuse-branding
pkgname="fcitx-skin-${_pkgname}"
pkgver=2.0
pkgrel=1
pkgdesc="Fcitx theme."
arch=("any")
url="http://kde-look.org/content/show.php/openSUSE+branding?content=153628"
license=('Creative Commons')
depends=('fcitx>=4.2.6')
source=("${_pkgname}.fskin"::'http://kde-look.org/CONTENT/content-files/153628-openSUSE-default.fskin')
md5sums=('57a906e8fc9192fd2c5ddea7cddd6acb')

build() {
    tar xzvf "${_pkgname}.fskin"
}

package() {
    install -dm755 "${pkgdir}/usr/share/fcitx/skin"
    mv openSUSE-default "${pkgdir}/usr/share/fcitx/skin/${_pkgname}"
}
