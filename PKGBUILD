pkgname=pocketbase-bin
pkgver=0.19.4
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
sha256sums=('2464c605a815d5a595a5e9c52ca0270b09e512c568cdf7c42545e48faaee1714')
