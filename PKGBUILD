# Maintainer: Hydral <nathan.dacunha.nd@gmail.com>

pkgname=hotspotshield-bin
pkgver=1.0.7
pkgrel=1
depends=('dbus' 'libnl' 'networkmanager')
arch=('x86_64')
pkgdesc='Hotspot Shield VPN client'
url='https://www.hotspotshield.com'
license=('custom')
source=("https://repo.hotspotshield.com/rpm/rel/all/hotspotshield-$pkgver.x86_64.rpm")

package() {
  rm -dr usr/lib
  mv usr/lib64 usr/lib
  cp -r etc usr "$pkgdir"
}
sha256sums=('6678ad1da674d455dec2476aeae7b036928a7061c403104fc57db560083e900a')
