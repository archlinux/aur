# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: asukaminato <asukaminato at nyan dot eu dot org>
# Contributor: Bradley Nelson <bradleynelson102 at gmail dot com>
# Contributor: liberodark Frederic Bezies

pkgname=stacer-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/QuentiumYT/Stacer"
license=('GPL3')
depends=('qt5-charts' 'qt5-svg' 'hicolor-icon-theme')
source=("${pkgname}.install")
source_x86_64=("https://launchpad.net/~quentiumyt/+archive/ubuntu/${pkgname%-bin}/+files/${pkgname%-bin}_${pkgver}-1_all.deb")
sha512sums=('7bed61f1ca2c53bb441f69a35d5e8a313a229bc34f114d121977379f48c3b9aa426d7a39a4c0363f1cad0cb8637b292263800d25bd317eceb517c19947bec3cd')
sha512sums_x86_64=('6c5bd9d8ce3a42408afa6d1127a4ccdaaa26d78f6e7bdfb1c8e8d0dfb1fbc57cf0055c2618d611bc1ce76593968d7562ae9e2516b305db2eb2771ca8cdadb4cc')
options=('!strip')
install="${pkgname}.install"
conflicts=('stacer' 'stacer-git')

package() {
       tar xpvf data.tar.xz -C "${pkgdir}"
}
