# Maintainer: Rodrigo Pelorosso <rodrigo.pelorosso@gmail.com>
pkgname=pktriot
pkgver=0.15.2
pkgrel=1
license=('unknown')
arch=('x86_64')
pkgdesc="The official Packetriot command line tool."
url="https://packetriot.com"
source=("https://download.packetriot.com/linux/RPM/packages/pktriot-$pkgver-$pkgrel.x86_64.rpm");
package() {
    cd ${srcdir}
    bsdtar -xf pktriot-${pkgver}-${pkgrel}.x86_64.rpm -C ${pkgdir}

}
md5sums=('29d909e6e9d34f7a9987dbce9fa4fec4')
