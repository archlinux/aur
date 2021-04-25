# Maintainer: gogogoghost <491511934@qq.com>
pkgname=aria2-systemd
pkgver=1.0
pkgrel=1
pkgdesc="Systemd unit setting a Aria2 Service"
arch=('any')
depends=('aria2')
source=(
    "aria2.service"
    "aria2.conf.example"
    "start-daemon.sh"
)
package() {
    install -Dm644 "$srcdir"/aria2.service "$pkgdir"/usr/lib/systemd/system/aria2.service
    install -Dm644 "$srcdir"/aria2.service "$pkgdir"/usr/lib/systemd/user/aria2.service
    install -Dm644 "$srcdir"/aria2.conf.example "$pkgdir"/etc/aria2/aria2.conf.example
    install -Dm755 "$srcdir"/start-daemon.sh "$pkgdir"/etc/aria2/start-daemon.sh
}
md5sums=('29dbe4a84d98cdb3824ceb1587236f1b'
         'ad931e8a6e4989cff16f7196eccca99a'
         '20842350316227bbd90fa3925dc7c4e5')
