# Maintainer: gogogoghost <491511934@qq.com>
pkgname=aria2-systemd
pkgver=1.1
pkgrel=2
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
         '7b88d722f8b8d4d67b68099d8196d608'
         '20842350316227bbd90fa3925dc7c4e5')
