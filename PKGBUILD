# Maintainer: kedap <kedap dot dev at protonmail dot com>
pkgname=invidtui-bin
_pkgname=invidtui
pkgver=0.1.8
pkgrel=2
pkgdesc="A TUI based Invidious client"
arch=('x86_64')
url="https://github.com/darkhz/invidtui"
license=('MIT')
depends=('mpv' 'yt-dlp')
source=("https://github.com/darkhz/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=("7eac85b55c7b7dd4353b0e15534b2476bcbed25d4665277acce694d486058ff2")

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
}
