pkgname=pocketbase-bin
pkgver=0.24.1
pkgrel=1
pkgdesc="Open source backend for your next project in 1 file"
arch=('x86_64')
url="https://github.com/pocketbase/pocketbase"
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('cb23ee65c86d90ff7147f0ab264f681412f7ef505bbf21a96979ab5cbdc46614')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
}
