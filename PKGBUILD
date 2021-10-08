# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=wol-systemd
pkgver=20210121
pkgrel=2
pkgdesc="A systemd unit file for enabling Wake-On-LAN automatically"
arch=('any')
url="https://wiki.archlinux.org/index.php/Wake-on-LAN"
license=('FDL1.3')
depends=('ethtool')
install=wol-systemd.install
source=('wol@.service' 'wol-systemd.install')

package() {
  install -Dm 644 wol@.service "${pkgdir}/usr/lib/systemd/system/wol@.service"
}
sha1sums=('6d5039ad3e08cd726a2f004d9566c8a1bd79ed6f'
          'ee32d3ec60f1257509b7bac3af36ff6b57ab325f')
