# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=csbooks-bin
pkgver=7.5.0
pkgrel=2
pkgdesc="csBooks is the best epub reader, pdf reader, mobi book reader and djvu reader for windows, linux and mac os. 
        It solves your problems if you need ebook manager, library manager on linux, best comic book reader, cbz file reader, cbr file reader etc."
arch=('x86_64')
url="https://caesiumstudio.com/csbooks/"
_githuburl="https://github.com/caesiumstudio/csBooks-updates"
license=('custom')
conflicts=('csbooks' 'csbooks-appimage')
depends=('alsa-lib' 'gtk3' 'nss' 'at-spi2-core')
options=()
source=("${pkgname}-${pkgver}.pacman::${_githuburl}/releases/download/latest/csBooks-${pkgver}.pacman")
sha512sums=('59d1aa3fe1b242eed38470c23ecd90855ce4077ae94b5bd2584654c3287c451834b4c449966604bd26871593b8fb2d7809d103ef967e09e0b1ed74cffb825d74')
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}
