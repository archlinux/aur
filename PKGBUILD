# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>

pkgname=bleachbit-root
pkgver=1.0.0
pkgrel=1
pkgdesc="Run bleachbit as root for cleaning system files"
arch=('any')
url="https://www.bleachbit.org/"
license=('GPL')
depends=('bleachbit'
         'polkit')
conflicts=('bleachbit-cli') # Requires desktop functions for bleachbit
source=('org.bleachbit.BleachBit-Root.desktop')
sha256sums=('bc8efe3ff4ea74ff526eb14d6155b87bc108a0edc7b487ee7275cd395212d172')

package() {
  install -Dm644 org.bleachbit.BleachBit-Root.desktop -t "$pkgdir"/usr/share/applications/
}
