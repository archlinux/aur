# Maintainer: Fabian Beuke <mail@beuke.org>
pkgname=dripcap
pkgver=0.3.10
pkgrel=1
arch=('x86_64')
pkgdesc="Caffeinated Packet Analyzer"
url="https://dripcap.org/"
license=('MIT')
depends=('wget')
sha256sums=('SKIP')

source=(http://mirror.easyname.at/blackarch/blackarch/os/${arch}/${pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz)

package() {
  tar xJvf ${pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz -C ${pkgdir}/
}
