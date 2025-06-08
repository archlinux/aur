pkgname=grlx-sprout-bin
pkgver=1.0.5
pkgrel=1
arch=('x86_64')
url="https://github.com/gogrlx/grlx/cmd/sprout"
license=('0BSD')
provides=('grlx-sprout')
conflicts=('grlx-sprout')
source=("https://github.com/gogrlx/grlx/releases/download/v${pkgver}/grlx-sprout-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('5027dc90e6158e03b0057ca14e9a4a0dbf26a8bc63e13b90028bbfeff667574d')

package() {
  install -Dm755 grlx-sprout "$pkgdir/usr/bin/grlx-sprout"
}

