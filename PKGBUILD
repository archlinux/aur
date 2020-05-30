# Maintainer: Nick Boughton (nicholasboughton@gmail.com)

pkgname=quasar-icongenie
pkgver=2.2.1
pkgrel=1
pkgdesc='CLI tool for building web application icons'
arch=(i686 x86_64)
url=https://quasar.dev/icongenie
license=(MIT)
depends=('nodejs>=10.0.0')
makedepends=('npm>=5.0.0')
optdepends=()
conflicts=()
options=(!strip)

package() {
  npm install -g --prefix="$pkgdir"/usr @quasar/icongenie@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
