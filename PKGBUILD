# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/QuentiumYT/Stacer"
license=('GPL-3.0-only')

depends=('glibc' 'gcc-libs' 'libsm' 'libx11' 'e2fsprogs' 'harfbuzz' 'libglvnd' 'gmp' 'libice' 'zlib' 'freetype2' 'hicolor-icon-theme' 'fontconfig' 'libxcb' 'qt6-base' 'qt6-charts')
conflicts=('stacer' 'stacer-git')

options=('!strip')

source_x86_64=("https://github.com/QuentiumYT/Stacer/releases/download/v${pkgver}/stacer_${pkgver}-${pkgrel}_amd64.deb")
sha512sums_x86_64=('3ed3216de64419cc6d9561803b3059a55d4516445c41ba8a9873bf42ba2d05702e5adde33581596c9a9276851ae50cdb74dbfec2006aeb99eb9066567538e551')


package() {
    tar xpvf data.tar.zst -C "${pkgdir}"
}
