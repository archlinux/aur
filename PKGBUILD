pkgname=pocketbase-bin
pkgver=0.27.2
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://github.com/pocketbase/pocketbase'
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('a82b12ed56d17f12127baa3c4b43b3a67b6fdf45890f09e952a8631c85a114a1')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
}
