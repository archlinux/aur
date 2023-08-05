# Maintainer: user20159 <https://aur.archlinux.org/account/user20159>

pkgname=wireguard-reresolve-dns
pkgver=1.0.0
pkgrel=1
pkgdesc="Periodically re-resolve the DNS of wireguard endpoints to support dynamic IPs"
arch=('any')
url='https://wiki.archlinux.org/title/WireGuard#Endpoint_with_changing_IP'
license=('LGPL')
depends=(wireguard-tools)
source=(wireguard-reresolve-dns.service wireguard-reresolve-dns.timer)
sha256sums=('fcded4dd42952472f400ca8e2eef50d79d65fddc109a637233733cd31681d344'
            '77c3dffb3ecd3c63339fa653f28c3466683d2b04333e3f93fe9a61ebf6e01a67')

package() {
  install -D -m644 wireguard-reresolve-dns.service "${pkgdir}/usr/lib/systemd/system/wireguard-reresolve-dns.service"
  install -D -m644 wireguard-reresolve-dns.timer "${pkgdir}/usr/lib/systemd/system/wireguard-reresolve-dns.timer"
}
