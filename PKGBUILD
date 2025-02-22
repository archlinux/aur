pkgname=pocketbase-bin
pkgver=0.25.7
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://github.com/pocketbase/pocketbase'
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('9c7beda9e830a6f9fc66a36ec7f08794c2d1ec11e9dd8fbcafd11ee1f668f5db')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
}
