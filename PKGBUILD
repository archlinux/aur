# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.3.6
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/QuentiumYT/Stacer"
license=('GPL-3.0-only')

depends=('glibc' 'gcc-libs' 'libsm' 'libx11' 'e2fsprogs' 'harfbuzz' 'libglvnd' 'gmp' 'libice' 'zlib' 'freetype2' 'hicolor-icon-theme' 'fontconfig' 'libxcb' 'qt6-base' 'qt6-charts')
conflicts=('stacer' 'stacer-git')

options=('!strip')

source_x86_64=("https://launchpad.net/~quentiumyt/+archive/ubuntu/${pkgname%-bin}/+files/${pkgname%-bin}_${pkgver}-${pkgrel}+noble_amd64.deb")
sha512sums_x86_64=('398d26ae3b8bdb7a288210c4a9ce0de10a8e4133689ef1cfae51a327d690cf901d0c16234ced68041d598533abb4c495cd93ad86089ebc841560ad80fb473278')


package() {
    tar xpvf data.tar.zst -C "${pkgdir}"
}
