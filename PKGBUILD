# Maintainer: suthernfriend <public@janpeterkoenig.com>
# Contributor: ajs124 < aur AT ajs124 DOT de >

pkgname=rpimonitor
pkgdesc="A self monitoring application designed to run on Raspberry Pi"
arch=('any')
license=('GPL')
pkgver=2.12
pkgrel=1
depends=('rrdtool' 'perl-http-daemon' 'perl-json' 'perl-ipc-sharelite' 'perl-file-which')
url=https://github.com/XavierBerger/RPi-Monitor
source=("$pkgname-$pkgver.tar.gz::https://github.com/XavierBerger/RPi-Monitor/archive/v${pkgver}.tar.gz")
sha256sums=('797336ebd7abbf0e635e1fbae9df6fb485112cfd916073f9b46330d7ad4636b9')

package() {
    cd RPi-Monitor-${pkgver}/
    cp -au src/* "${pkgdir}"/
    rm -rf "${pkgdir}"/etc/apt
}
