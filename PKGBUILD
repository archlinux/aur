# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=heimer-bin
pkgver=4.2.0
pkgrel=2
pkgdesc="A simple cross-platform mind map, diagram, and note-taking tool written in Qt."
arch=("x86_64")
url="https://github.com/juzzlin/Heimer"
license=('GPL3')
depends=('qt5-base' 'glibc' 'hicolor-icon-theme' 'gcc-libs' 'qt5-svg')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-ubuntu-22.04_amd64.deb")
sha256sums=('b2ff590499dd16c773312f53e956148621831199d294dee1173915ad621acb51')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}