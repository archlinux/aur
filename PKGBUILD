# Maintainer: HRKo <ootaharuki99[at]gmail.com>
_skinname='material'
pkgname='fcitx-skin-material'
pkgver=0.2
pkgrel=1
pkgdesc='a Material Design-like skin for Fcitx.'
arch=('any')
url="https://github.com/ootaharuki99/fcitx-skin-material"
license=('Apache')
depends=('fcitx')
source=('https://github.com/ootaharuki99/fcitx-skin-material/releases/download/v0.2/fcitx-skin-material_0.2.tar.gz')
md5sums=('aafd6028d4400e807a754d2109f4f6e4')

package() {
    install -dm755 ${pkgdir}/usr/share/fcitx/skin/${_skinname}
    install -m644 ${srcdir}/material/* ${pkgdir}/usr/share/fcitx/skin/${_skinname}
}
