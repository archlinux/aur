pkgname=pocketbase-bin
pkgver=0.22.14
pkgrel=1
pkgdesc="Open source backend for your next project in 1 file"
arch=('x86_64')
url="https://github.com/pocketbase/pocketbase"
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
package() {
  install -Dm755 $srcdir/pocketbase  "${pkgdir}/usr/bin/pocketbase"
}
sha256sums=('befb86c92c2b28e3b9930b9370d117556439120be2c296510a8cb26bec9589d8')
