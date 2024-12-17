pkgname=pocketbase-bin
pkgver=0.23.8
pkgrel=1
pkgdesc="Open source backend for your next project in 1 file"
arch=('x86_64')
url="https://github.com/pocketbase/pocketbase"
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('61c32abae7eade645aec6e330ea214e2d234a3e91d1304618e0110b41744400a')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
}
