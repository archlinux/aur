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
sha512sums=('d816e39c7df25466776c6f74fb73d95bbf61173228ef1dcb226e791af6dcc278faf817d765a64ef949f11b1525b52d51195ca9be3486bbdccc95c67bbe189d6d')

package() {
	cd RPi-Monitor-${pkgver}/
    cp -au src/* "${pkgdir}"/
    rm -rf "${pkgdir}"/etc/apt
}
