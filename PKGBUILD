# Maintainer: Gallifreyan <gallifreyan at protonmail dot ch>

pkgname=godsvg-bin
_pkgbase=godsvg
_pkgname=GodSVG

_pkgver=1.0-alpha4
pkgver=${_pkgver//-/_}
pkgrel=1

pkgdesc='An editor for Scalable Vector Graphics (SVG) files. Built with Godot'
arch=('x86_64')

url='https://godsvg.com'
_url='https://github.com/MewPurPur/GodSVG'

<<<<<<< HEAD
license=(MIT)
=======
license=('MIT')
>>>>>>> ae6d430 (i am so sorry i am an idiot)

depends=(
    glibc
    libglvnd
)
provides=(
    godsvg
)
conflicts=(
    godsvg
    godsvg-git
)

source=(
<<<<<<< HEAD
    "${_pkgname}-${_pkgver}.zip::${_url}/releases/download/v${_pkgver}/GodSVG.Linux.zip"
    "LICENSE::${_url}/raw/main/LICENSE"
    "godsvg.png::https://raw.githubusercontent.com/MewPurPur/GodSVG/main/visual/icon.png"
    "godsvg.desktop"
=======
    "GodSVG-${_pkgver}.zip::${_url}/releases/download/v${_pkgver}/GodSVG.Linux.zip"
    "LICENSE::${_url}/raw/main/LICENSE"
    "godsvg.png::https://raw.githubusercontent.com/MewPurPur/GodSVG/main/visual/icon.png"
    "godsvg.desktop::https://aur.archlinux.org/cgit/aur.git/plain/godsvg.desktop?h=godsvg-bin"
>>>>>>> ae6d430 (i am so sorry i am an idiot)
)
sha256sums=('59ed79c724cd065e34197dfc41da1d52f0598434b0618a750633170ece384e15'
            'a2e1a9795671794be3a25bd921a16f0fa9819ede1ead54a13da6edb34bfc0ee1'
            'c809390a25c9a922a1f122d48492dac8ed32c288df827c5605e86358d84cd1c1'
            '3727b1980d672f7aa92915a1f19b17c9800bef55f82d59002e2265e7d7ffb8d5')

options=(
    !strip
    !debug
)

package() {
    install -Dm755 "GodSVG.${CARCH}" "${pkgdir}/usr/bin/godsvg"
<<<<<<< HEAD
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "godsvg.desktop" -t "${pkgdir}/usr/share/applications/godsvg.desktop"
=======
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "godsvg.desktop" -t "${pkgdir}/usr/share/applications/"
>>>>>>> ae6d430 (i am so sorry i am an idiot)
    install -Dm644 "godsvg.png" -t "${pkgdir}/usr/share/pixmaps/"
}
