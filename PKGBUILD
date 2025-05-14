pkgname=pocketbase-bin
pkgver=0.28.1
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://github.com/pocketbase/pocketbase'
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('bd819d0bea051ccaee004e8c47c5e9cf642974facb3b05466e262cc803b902b5')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
  install -Dm644 $srcdir/LICENSE.md -t "usr/share/licenses/$_pkgname"
}
