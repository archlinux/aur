# Maintainer: HRKo <ootaharuki99 [at] gmail [dot] com>

_skinname='material'
pkgname='fcitx-skin-material'
pkgver=0.1
pkgrel=2
pkgdesc='a Material Design-like skin for Fcitx.'
arch=('any')
url="https://github.com/ootaharuki99/fcitx-skin-material"
license=('Apache')
depends=('fcitx')
source=('https://github.com/ootaharuki99/fcitx-skin-material/releases/download/v0.1/fcitx-skin-material_0.1.tar.gz')
md5sums=('0800f2750dd2d7cedf1ceac54aaa3898')

package() {
    install -dm755 ${pkgdir}/usr/share/fcitx/skin/${_skinname}
    install -m644 ${srcdir}/material/* ${pkgdir}/usr/share/fcitx/skin/${_skinname}
}