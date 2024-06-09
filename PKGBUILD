# Maintainer: Tjw123hh <tjw123hh@outlook.com>
# Contributor: Cassandra Watergate <spammmwhat@gmail.com>

pkgname=bleachbit-root
pkgver=1.0.2
pkgrel=5
pkgdesc="Run bleachbit as root for cleaning system files"
arch=('any')
url="https://www.bleachbit.org/"
license=('GPL')
depends=('bleachbit'
         'polkit')
conflicts=('bleachbit-cli') # Requires desktop functions for bleachbit
source=('org.bleachbit.BleachBit-Root.desktop')
sha256sums=('407e04a20f0944e31298dc56c540903e5eb74c452396678a4ba5e26ef85f39f7')
optdepends=('xorg-xhost: Xorg support')

package() {
  install -Dm644 org.bleachbit.BleachBit-Root.desktop -t "${pkgdir}/usr/share/applications/"
}
