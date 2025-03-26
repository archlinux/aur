pkgname=pocketbase-bin
pkgver=0.26.4
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://github.com/pocketbase/pocketbase'
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('dce7d79c11b84650b592a282e75806823c3150acfd8546479db040b70ac47d25')
package() {
  install -Dm755 $srcdir/pocketbase  "$pkgdir/usr/bin/pocketbase"
}
