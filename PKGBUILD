# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.3.2
pkgrel=2
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/QuentiumYT/Stacer"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libsm' 'libx11' 'e2fsprogs' 'harfbuzz' 'libglvnd' 'gmp' 'libice' 'zlib' 'freetype2' 'hicolor-icon-theme' 'fontconfig' 'libxcb')
source=("${pkgname}.install")
source_x86_64=("https://launchpad.net/~quentiumyt/+archive/ubuntu/${pkgname%-bin}/+files/${pkgname%-bin}_${pkgver}-${pkgrel}_all.deb")
sha512sums=('7bed61f1ca2c53bb441f69a35d5e8a313a229bc34f114d121977379f48c3b9aa426d7a39a4c0363f1cad0cb8637b292263800d25bd317eceb517c19947bec3cd')
sha512sums_x86_64=('190e23e23d9b39858dbbcdf7a770196625fa98e18dd249be52b5834e291ae50f448e377331f8cffaaadf9828d3808050506caeda1ea56ed0692c637e3ea5ca7f')
options=('!strip')
install="${pkgname}.install"
conflicts=('stacer' 'stacer-git')

package() {
       tar xpvf data.tar.xz -C "${pkgdir}"
}
