# Maintainer: Jaco Malan <jacomalan.12@gmail.com>
pkgname=pktriot
pkgver=0.9.5
pkgrel=1
license=('unknown')
arch=('x86_64')
pkgdesc="The official Packetriot command line tool."
url="https://packetriot.com"
source=("https://pktriot-dl-bucket.sfo2.digitaloceanspaces.com/releases/linux/pktriot-$pkgver-$pkgrel.x86_64.rpm");

package() {

    cd ${srcdir}
    bsdtar -xf pktriot-${pkgver}-${pkgrel}.x86_64.rpm -C ${pkgdir}

}
md5sums=('3f2f2a53d31f103e9505bbc2a6653c4c')
