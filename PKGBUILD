pkgname=pocketbase-bin
pkgver=0.29.0
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://github.com/pocketbase/pocketbase'
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('27728cd6d811b805597c099ed46a39128be5e20e5bd0dd7929dbc65a95a18940')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
  install -Dm644 $srcdir/LICENSE.md -t "usr/share/licenses/$_pkgname"
}
