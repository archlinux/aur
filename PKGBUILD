# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/QuentiumYT/Stacer"
license=('GPL-3.0-only')

depends=('glibc' 'gcc-libs' 'libsm' 'libx11' 'e2fsprogs' 'harfbuzz' 'libglvnd' 'gmp' 'libice' 'zlib' 'freetype2' 'hicolor-icon-theme' 'fontconfig' 'libxcb' 'qt6-base' 'qt6-charts')
conflicts=('stacer' 'stacer-git')

options=('!strip')

source_x86_64=("https://github.com/QuentiumYT/Stacer/releases/download/v${pkgver}/stacer_${pkgver}-${pkgrel}_amd64.deb")
sha512sums_x86_64=('b0bb85a0c4ec3a4de2c339d2aea7e84c73aa2b41f4c862988069f472ae54d0dee033ef8d74b16176d563a961154ac47986b7699023308eb1e915529a6fc55099')


package() {
    tar xpvf data.tar.zst -C "${pkgdir}"
}
