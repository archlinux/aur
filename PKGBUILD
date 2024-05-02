# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Hydral <nathan.dacunha.nd@gmail.com>

pkgname=hotspotshield-bin
pkgver=1.0.7
pkgrel=2
pkgdesc='Hotspot Shield VPN client for Linux. Public build'
url='https://hotspotshield.com'
license=('custom')
arch=('x86_64')
depends=('dbus' 'libnl' 'networkmanager')
source=("https://repo.hotspotshield.com/rpm/rel/all/hotspotshield-$pkgver.x86_64.rpm")
sha256sums=('6678ad1da674d455dec2476aeae7b036928a7061c403104fc57db560083e900a')

package() {
  rm -dr usr/lib
  mv usr/lib64 usr/lib
  mv etc usr "$pkgdir"
}
