# Maintainer: papojari <papojari-git.ovoid@aleeas.com>

pkgname='sanctity'
pkgver=1.3.1
pkgrel=1
pkgdesc='Test the 16 terminal colors in all combinations'
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/papojari/$pkgname"
license=('LGPL3')
makedepends=('just' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/papojari/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6b1595cf7cac170e843f8b79fa8d0ffbf848e49582a3429d97b9e75a1328d47f')

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  export SANCTITY_INSTALL_PATH="$pkgdir/usr"
  just custom-install
}
