# Maintainer: GG weebcyberpunk@gmail.com
pkgname=batterymon-git
pkgver=1.0.2
pkgrel=2
pkgdesc="Simple battery monitor"
arch=('any')
url="https://www.github.com/weebcyberpunk/batterymon"
license=('MIT')
provides=(batterymon)
depends=(python libnotify python-psutil)
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "batterymon"

}

package() {
    cd "batterymon"
    install -Dm755 batterymon $pkgdir/usr/bin/batterymon
    install -Dm644 batterymon.1 $pkgdir/usr/share/man/man1/batterymon.1
}
