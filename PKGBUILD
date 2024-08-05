# Maintainer: Tjw123hh <tjw123hh@outlook.com>
# Contributor: Cassandra Watergate <spammmwhat@gmail.com>

pkgname=bleachbit-root
pkgver=1.0.2
pkgrel=6
pkgdesc="Run bleachbit as root for cleaning system files"
arch=('any')
url="https://www.bleachbit.org/"
license=('GPL')
depends=('bleachbit'
         'polkit')
source=('org.bleachbit.BleachBit-Root.desktop'
        'org.bleachbit.BleachBit-Root.policy')
sha256sums=('c2b05ba8d099ede8a39fbce96bd88a4833f37d66459aa3762665346c171a86b2'
            '069611921297e3ab09222f594be8214e3722f2218bc48325c78758fae71f535f')

package() {
  install -Dm644 org.bleachbit.BleachBit-Root.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 org.bleachbit.BleachBit-Root.policy -t "${pkgdir}/usr/share/polkit-1/actions/"
}
