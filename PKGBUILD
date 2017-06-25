pkgname=rtc-daemon-phonepi
pkgver=1
pkgrel=1
pkgdesc="Time syncronization deamon for PhonePi project"
url="https://github.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git")
depends=("i2c-tools")
source=(git://github.com/PhonePi/phonepi.git)
sha256sums=("SKIP")

package() {
	cd "$srcdir/phonepi/src/daemonRTC"
	install -Dm755 "./rtc.service" "$pkgdir/usr/lib/system.d/system/rtc.service"
}
