# Maintainer: ajs124 < aur AT ajs124 DOT de >

pkgname=rpimonitor
pkgdesc="A self monitoring application designed to run on Raspberry Pi"
arch=(any)
license=('GPL')
pkgver=2.11
pkgrel=1
depends=(rrdtool perl-http-daemon perl-json perl-ipc-sharelite perl-file-which)
url=https://github.com/XavierBerger/RPi-Monitor
source=($pkgname-$pkgver.tar.gz::https://github.com/XavierBerger/RPi-Monitor/archive/v${pkgver}.tar.gz)
sha512sums=('1f6ecd73279405e83b53b8bafc488d46e9a78189a00fce1aacd3fb01b8ffed21154021783fbdbb0ec1f43d928d7454bb43a5f0e289511d71183e3347418cb183')

package() {
	cd RPi-Monitor-${pkgver}/
    cp -au src/* "${pkgdir}"/
    rm -rf "${pkgdir}"/etc/apt
}
