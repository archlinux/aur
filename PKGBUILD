pkgname=pocketbase-bin
pkgver=0.23.5
pkgrel=1
pkgdesc="Open source backend for your next project in 1 file"
arch=('x86_64')
url="https://github.com/pocketbase/pocketbase"
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('de3f70a99d534988a9919db96605303e19343cd6792d8edb4f894d69a1b560e1')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
}
