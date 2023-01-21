pkgname=pocketbase-bin
pkgver=0.11.3
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
sha256sums=('27a261e2d16339e533c428b84f9c486064818e759a2931fa539469c86858a935')
