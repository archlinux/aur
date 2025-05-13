# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.3.5
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/QuentiumYT/Stacer"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libsm' 'libx11' 'e2fsprogs' 'harfbuzz' 'libglvnd' 'gmp' 'libice' 'zlib' 'freetype2' 'hicolor-icon-theme' 'fontconfig' 'libxcb' 'qt6-base' 'qt6-charts')
source=("${pkgname}.install")
source_x86_64=("https://launchpad.net/~quentiumyt/+archive/ubuntu/${pkgname%-bin}/+files/${pkgname%-bin}_${pkgver}-${pkgrel}+noble_all.deb")
sha512sums=('7bed61f1ca2c53bb441f69a35d5e8a313a229bc34f114d121977379f48c3b9aa426d7a39a4c0363f1cad0cb8637b292263800d25bd317eceb517c19947bec3cd')
sha512sums_x86_64=('bd33039846b17b16a45f3e99e99756e58df38cddbc9433bedbc800686b39890db23bbc8bc89adad720891c529ab314c92932db4f164b767a564685c786a151d5')
options=('!strip')
install="${pkgname}.install"
conflicts=('stacer' 'stacer-git')

package() {
    tar xpvf data.tar.zst -C "${pkgdir}"
}
