# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=hotspotshield-test-bin
pkgver=1.1.2
pkgrel=3
pkgdesc='Hotspot Shield VPN client for Linux. Internal build'
url='https://hotspotshield.com'
license=('custom')
arch=('x86_64')
depends=('dbus' 'libnl' 'networkmanager' 'systemd-libs')
provides=("hotspotshield-bin")
conflicts=("hotspotshield-bin")
source=("https://repo.hotspotshield.com/wirequard/hotspotshield-$pkgver.x86_64.rpm")
sha256sums=('5f80402651da2087849a9d8046c66d4e711d466d426fd5d58d6558977439b9af')

package() {
  rm -dr usr/lib
  mv usr/lib64 usr/lib
  mv etc usr "$pkgdir"
}
