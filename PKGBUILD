# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/QuentiumYT/Stacer"
license=('GPL-3.0-only')

depends=('glibc' 'gcc-libs' 'libsm' 'libx11' 'e2fsprogs' 'harfbuzz' 'libglvnd' 'gmp' 'libice' 'zlib' 'freetype2' 'hicolor-icon-theme' 'fontconfig' 'libxcb' 'qt6-base' 'qt6-charts')
conflicts=('stacer' 'stacer-git')

options=('!strip')

source_x86_64=("https://github.com/QuentiumYT/Stacer/releases/download/v${pkgver}/stacer_${pkgver}-${pkgrel}_amd64.deb")
sha512sums_x86_64=('e7e9d0ea65c72ad217df154c5bd21057865d73d382cbceec7ff300e1d635cad5cb3eeb33776719eaba8dc6615954fd4ffc02120c42a49ddb3e42888e9f1c4f25')


package() {
    tar xpvf data.tar.zst -C "${pkgdir}"
}
