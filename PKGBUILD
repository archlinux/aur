# Maintainer: Terry Tao <librakevin@gmail.com>
# Maintainer: Hexchain Tong <i at hexchain dot org>

pkgname=tinc-pre-systemd
pkgver=3
pkgrel=1
pkgdesc="systemd unit files for aur/tinc-pre"
arch=('any')
url="http://www.tinc-vpn.org"
license=('GPL3')
depends=('tinc-pre')
source=('tincd@.service' 'tincd.service')

package() {
    install -D -m644 "$srcdir/tincd@.service" "$pkgdir/usr/lib/systemd/system/tincd@.service"
    install -D -m644 "$srcdir/tincd.service" "$pkgdir/usr/lib/systemd/system/tincd.service"
}
md5sums=('8029b9d35e0abe980d4677c41647f395'
         'db9bbc5ccfc1b2af12ff048db151e289')
