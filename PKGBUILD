pkgname=pocketbase-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="Open source backend for your next project in 1 file"
arch=('x86_64')
url="https://github.com/pocketbase/pocketbase"
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('58ddb379949641d713b56322a93ac634bef6b0e4fa6c55736a60c6ec69a4b5d8')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
}
