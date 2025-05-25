pkgname=pocketbase-bin
pkgver=0.28.2
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://github.com/pocketbase/pocketbase'
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('45ed30c15a764e3c626d81a48f0206803f0712a1d86f0694120fa190759733bf')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
  install -Dm644 $srcdir/LICENSE.md -t "usr/share/licenses/$_pkgname"
}
