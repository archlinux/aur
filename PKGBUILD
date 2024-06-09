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
conflicts=('bleachbit-cli') # Requires desktop functions for bleachbit
source=('org.bleachbit.BleachBit-Root.desktop'
        'org.bleachbit.BleachBit-Root.policy')
sha256sums=('4e05d8571e3ace3c16f99f6701ca89628d73580cf8035484c614cd6ddd845772'
            '069611921297e3ab09222f594be8214e3722f2218bc48325c78758fae71f535f')

package() {
  install -Dm644 org.bleachbit.BleachBit-Root.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 org.bleachbit.BleachBit-Root.policy -t "${pkgdir}/usr/share/polkit-1/actions/"
}
