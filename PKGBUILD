# Maintainer: Dictator Mei <dctxmei@gmail.com>
pkgname=aria2-systemd
pkgver=1.0
pkgrel=1
pkgdesc="Systemd unit setting a Aria2 Service"
arch=('any')
depends=('aria2')
source=("aria2.service")
sha512sums=('46e75c9714ac884770e1cf458e5651c3f128d2a74c8fd724c5bc436b98f99aabfc6915f5bb0cf51f71e69c44eef0a066fe842d94328af41afaf0ed4bdfe5c742')

package() {
    install -Dm644 "$srcdir"/aria2.service "$pkgdir"/usr/lib/systemd/user/aria2.service
}
