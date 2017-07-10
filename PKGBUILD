# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>
pkgname=rtc-daemon-phonepi
pkgver=1
pkgrel=2
pkgdesc="Time syncronization deamon for PhonePi project"
url="https://gitlab.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git")
depends=("i2c-tools")
source=('git+https://gitlab.com/PhonePi/Phone')
sha256sums=("SKIP")

package() {
	cd "$srcdir/Phone/src/daemonRTC"
	install -Dm755 "./rtc.service" "$pkgdir/usr/lib/systemd/system/rtc.service"
}
