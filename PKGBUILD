# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.1.0
pkgrel=5
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/oguzhaninan/Stacer"
license=('GPL3')
depends=('qt5-charts' 'qt5-svg' 'hicolor-icon-theme')
source=("${pkgname}.install")
source_x86_64=("https://github.com/oguzhaninan/Stacer/releases/download/v${pkgver}/stacer_${pkgver}_amd64.deb")
sha512sums=('7bed61f1ca2c53bb441f69a35d5e8a313a229bc34f114d121977379f48c3b9aa426d7a39a4c0363f1cad0cb8637b292263800d25bd317eceb517c19947bec3cd')
sha512sums_x86_64=('19bcb87f3d99ce090ab1fb917f65f7dd74f0b1e4fc19272eae0ad8d5c66d3dbe53cbdb50841bbd9a0e16f03201cd6cc5f0bc1a57eda41fd096ed275cf762d84a')
options=('!strip')
install="${pkgname}.install"
conflicts=('stacer' 'stacer-git')

package() {
       tar xpvf data.tar.xz -C "${pkgdir}"
}
