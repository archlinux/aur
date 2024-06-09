# Maintainer: Tjw123hh <tjw123hh@outlook.com>
# Contributor: Cassandra Watergate <spammmwhat@gmail.com>

pkgname=bleachbit-root
pkgver=1.0.2
pkgrel=4
pkgdesc="Run bleachbit as root for cleaning system files"
arch=('any')
url="https://www.bleachbit.org/"
license=('GPL')
depends=('bleachbit'
         'polkit')
conflicts=('bleachbit-cli') # Requires desktop functions for bleachbit
source=('org.bleachbit.BleachBit-Root.desktop')
sha256sums=('86f8438dde194afbddcf403e4ca10cb553178f1230a840e26851230297057715')
optdepends=('xorg-xhost: Xorg support')

package() {
  install -Dm644 org.bleachbit.BleachBit-Root.desktop -t "${pkgdir}/usr/share/applications/"
}
