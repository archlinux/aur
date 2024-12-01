pkgname=pocketbase-bin
pkgver=0.23.2
pkgrel=1
pkgdesc="Open source backend for your next project in 1 file"
arch=('x86_64')
url="https://github.com/pocketbase/pocketbase"
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('40e3eab0257d0378eae25bb6dc1dbf8fef4d0ea55e6b4b6a540815df159e5c4a')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
}
