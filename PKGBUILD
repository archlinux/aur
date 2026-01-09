# Maintainer: Tjw123hh <tjw123hh@outlook.com>
# Contributor: Cassandra Watergate <spammmwhat@gmail.com>

pkgname=bleachbit-root
pkgver=1.0.3
pkgrel=6
pkgdesc="Run bleachbit as root for cleaning system files"
arch=('any')
url="https://www.bleachbit.org/"
license=('GPL')
depends=('bleachbit'
         'polkit')
source=('org.bleachbit.BleachBit-Root.desktop')
sha256sums=('a3ec3147a16b14930cef8b25f012230b191b37b10a1531e46d5b545f9bda6bd0')

package() {
  install -Dm644 org.bleachbit.BleachBit-Root.desktop -t "${pkgdir}/usr/share/applications/"
}
