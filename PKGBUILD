pkgname=pocketbase-bin
pkgver=0.8.0
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/pocketbase/pocketbase"
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('c1b6631ba4a58d29e42bc441107f17db0d20c939cf1e6dc6e3882130cd0660e1')
package() {
  install -Dm755 $srcdir/pocketbase  "${pkgdir}/usr/bin/pocketbase"
}
