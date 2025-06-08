pkgname=grlx-farmer-bin
pkgver=1.0.5
pkgrel=1
arch=('x86_64')
url="https://github.com/gogrlx/grlx/cmd/farmer"
license=('0BSD')
provides=('grlx-farmer')
conflicts=('grlx-farmer')
source=("https://github.com/gogrlx/grlx/releases/download/v${pkgver}/grlx-farmer-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('51c0ace1b754808f2d4aa050c76ab9f6efadf3b0a4140ce08652a2e0ebe578a4')

package() {
  install -Dm755 grlx-farmer "$pkgdir/usr/bin/grlx-farmer"
}

