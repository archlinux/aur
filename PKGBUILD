# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.6.3
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/QuentiumYT/Stacer"
license=('GPL-3.0-only')

depends=('glibc' 'gcc-libs' 'libsm' 'libx11' 'e2fsprogs' 'harfbuzz' 'libglvnd' 'gmp' 'libice' 'zlib' 'freetype2' 'hicolor-icon-theme' 'fontconfig' 'libxcb' 'qt6-base' 'qt6-charts')
conflicts=('stacer' 'stacer-git')

options=('!strip')

source_x86_64=("https://github.com/QuentiumYT/Stacer/releases/download/v${pkgver}/stacer_${pkgver}-${pkgrel}_amd64.deb")
sha512sums_x86_64=('8651d590dbd5d794a625a6980849806dfdbee22ba05b0ba37eb63faa2ad30200d63db3bd43806fa157a1e4fb358033c577b2bc4ad12f67522c3ecbe78223703d')


package() {
    tar xpvf data.tar.zst -C "${pkgdir}"
}
