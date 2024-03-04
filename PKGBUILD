# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=wol-systemd
pkgver=20240304
pkgrel=1
pkgdesc="A systemd unit file for enabling Wake-On-LAN automatically"
arch=('any')
url="https://wiki.archlinux.org/index.php/Wake-on-LAN"
license=('FDL1.3')
depends=('ethtool')
source=('wol@.service')
install=wol-systemd.install

package() {
  install -Dm 644 wol@.service "${pkgdir}/usr/lib/systemd/system/wol@.service"
}
sha256sums=('83cf4620006eea447d544c1d06f190e8f6e065ea8f0ace962387bb9580583c68')
