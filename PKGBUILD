# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.1.0
pkgrel=3
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/oguzhaninan/Stacer"
license=('GPL3')
depends=('qt5-charts' 'qt5-svg' 'hicolor-icon-theme')
source=("${pkgname}.install")
source_x86_64=("https://github.com/oguzhaninan/Stacer/releases/download/v${pkgver}/stacer_${pkgver}_amd64.deb")
sha512sums=('e909cdf5865348399775a574641aed1455c2671a4d611ceb25ac377432a47f442e5cbd4609f7dbef41abe1a04f4efd6618bd289407f6743310fedf146907084a')
sha512sums_x86_64=('19bcb87f3d99ce090ab1fb917f65f7dd74f0b1e4fc19272eae0ad8d5c66d3dbe53cbdb50841bbd9a0e16f03201cd6cc5f0bc1a57eda41fd096ed275cf762d84a')
options=('!strip')
install="${pkgname}.install"
conflicts=('stacer' 'stacer-git')

package() {
       tar xpvf data.tar.xz -C "${pkgdir}"
}
