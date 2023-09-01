# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>
pkgname=redpanda-cpp-bin
pkgver=2.24
pkgrel=1
pkgdesc="A light-weight C/C++ IDE based on Qt"
arch=('x86_64')
url="https://sourceforge.net/projects/redpanda-cpp"
_githuburl="https://github.com/royqh1979/RedPanda-CPP"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'gcc-libs' 'glibc')
optdepends=('gcc' 'gdb' 'git' 'make' 'qterminal' 'raylib' 'raylib-drawing')
provides=('redpanda-cpp')
conflicts=('redpanda-cpp')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.ubuntu20.04.deb")
sha256sums=('aec532a3983f22284a2c422cb6fc7e85e45d27b12ba13d8d58357b92b53de646')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}