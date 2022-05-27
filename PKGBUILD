# Maintainer SimPilotAdamT <adam_tazul@outlook.com>
# Developer DrDonk <https://github.com/DrDonk>

pkgname=vmware-unlocker
pkgver=4.2.0
pkgrel=1
pkgdesc="VMware macOS utilities"
arch=('x86_64')
url="https://github.com/DrDonk/unlocker"
license=('MIT')
makedepends=('git' 'libarchive')
source=("https://github.com/DrDonk/unlocker/releases/download/v$pkgver/unlocker420.zip")
md5sums=('403f60e1a71debbfcbc6393f7184d3de')
build() {
  printf ""
}
package() {
  mkdir -p "$pkgdir"/usr/bin/iso/
  install -Dm755 "$srcdir"/linux/* "$pkgdir"/usr/bin/
  install -Dm644 "$srcdir"/iso/* "$pkgdir"/usr/bin/iso/
}
