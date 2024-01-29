pkgname=pocketbase-bin
pkgver=0.21.1
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
sha256sums=('c8c0040927e569ce0e8e52e4d3b9c097175216901c1ead983c937a6eab30fbfa')
