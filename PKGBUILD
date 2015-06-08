# Maintainer: wenLiangcan <boxeed at gmail dot com>

_pkgname=dartmouth
pkgname="fcitx-skin-${_pkgname}"
pkgver=1.0
pkgrel=1
pkgdesc="Dartmouth is a fcitx theme."
arch=("any")
url="http://kde-look.org/content/show.php/%22Dartmouth%22+-+Fcitx+openSUSE+12.3+Theme?content=156641"
license=('GPL')
depends=('fcitx>=4.2.6')
source=("${_pkgname}.fskin"::'http://kde-look.org/CONTENT/content-files/156641-fcitx-openSUSE-12.3.fskin')
md5sums=('d744f95174a27aa5756e8719a88b1ddc')

build() {
    tar xzvf "${_pkgname}.fskin"
}

package() {
    install -dm755 "${pkgdir}/usr/share/fcitx/skin"
    mv openSUSE-default "${pkgdir}/usr/share/fcitx/skin/${_pkgname}"
}
