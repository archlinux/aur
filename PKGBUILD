# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/QuentiumYT/Stacer"
license=('GPL-3.0-only')

depends=('glibc' 'gcc-libs' 'libsm' 'libx11' 'e2fsprogs' 'harfbuzz' 'libglvnd' 'gmp' 'libice' 'zlib' 'freetype2' 'hicolor-icon-theme' 'fontconfig' 'libxcb' 'qt6-base' 'qt6-charts')
conflicts=('stacer' 'stacer-git')

options=('!strip')

source_x86_64=("https://launchpad.net/~quentiumyt/+archive/ubuntu/${pkgname%-bin}/+files/${pkgname%-bin}_${pkgver}-${pkgrel}+noble_amd64.deb")
sha512sums_x86_64=('e3ed3e824634ee2a0292b7fbe5f04245e70548b63f073fe0aefe7a95593efdd388f52532f49d9487028940a09ae8ad1f7a1ea522631ae6024d532759b9055dcb')


package() {
    tar xpvf data.tar.zst -C "${pkgdir}"
}
