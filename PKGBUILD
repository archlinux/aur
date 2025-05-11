pkgname=pocketbase-bin
pkgver=0.28.0
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://github.com/pocketbase/pocketbase'
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('637340e93e7855e6ca41281da56047423468ad3af5f6df2ae6e4d92cbfee5f68')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
  install -Dm644 $srcdir/LICENSE.md -t "usr/share/licenses/$_pkgname"
}
