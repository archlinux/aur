# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=wol-systemd
pkgver=20150903
pkgrel=2
pkgdesc="A systemd unit file for enabling Wake-On-LAN automatically"
arch=('any')
url="https://wiki.archlinux.org/index.php/Wake-on-LAN"
license=('MIT')
depends=('ethtool')
install=wol-systemd.install
source=('wol@.service' 'wol-systemd.install')

package() {
  install -Dm 644 wol@.service "${pkgdir}/usr/lib/systemd/system/wol@.service"
}
sha1sums=('2fae47e792b954f8e70a2dbe9df56458e65ff75b'
          'ee32d3ec60f1257509b7bac3af36ff6b57ab325f')
