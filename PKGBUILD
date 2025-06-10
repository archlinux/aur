pkgname=pocketbase-bin
pkgver=0.28.3
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://github.com/pocketbase/pocketbase'
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('47464b12e6f8771f5731680fb712a2acc261bfa806e88abf3a697040f3fb2b07')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
  install -Dm644 $srcdir/LICENSE.md -t "usr/share/licenses/$_pkgname"
}
