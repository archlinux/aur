# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.3.3
pkgrel=1
_buildid=30431799
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/QuentiumYT/Stacer"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libsm' 'libx11' 'e2fsprogs' 'harfbuzz' 'libglvnd' 'gmp' 'libice' 'zlib' 'freetype2' 'hicolor-icon-theme' 'fontconfig' 'libxcb')
source=("${pkgname}.install")
source_x86_64=("https://launchpad.net/~quentiumyt/+archive/ubuntu/${pkgname%-bin}/+build/${_buildid}/+files/${pkgname%-bin}_${pkgver}-${pkgrel}_all.deb")
sha512sums=('7bed61f1ca2c53bb441f69a35d5e8a313a229bc34f114d121977379f48c3b9aa426d7a39a4c0363f1cad0cb8637b292263800d25bd317eceb517c19947bec3cd')
sha512sums_x86_64=('d4bec15fa7d1b728b7875ec398512f65d28779e29cea49c1a124c299de6dac959b8ffcd0c2450b77cd8ae95e81da9fa0f81817e1f457d92fae5db1c3b686e3a7')
options=('!strip')
install="${pkgname}.install"
conflicts=('stacer' 'stacer-git')

package() {
       tar xpvf data.tar.zst -C "${pkgdir}"
}
