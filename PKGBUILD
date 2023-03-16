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
source=('org.bleachbit.BleachBit-Root.desktop')
sha256sums=('aa95de7ccbd5802ca7aa94e1f1ba60b83df863dad042d66240c1ffd573bbedc4')

package() {
  install -Dm644 org.bleachbit.BleachBit-Root.desktop -t "$pkgdir"/usr/share/applications/
}
