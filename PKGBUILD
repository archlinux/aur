pkgname=grlx-bin
pkgver=1.0.5
pkgrel=1
arch=('x86_64')
url="https://github.com/gogrlx/grlx"
license=('0BSD')
provides=('grlx')
conflicts=('grlx')
source=("https://github.com/gogrlx/grlx/releases/download/v${pkgver}/grlx-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('70e980e41c91ab0905294f696ff53f2578982146aa63a7b69d495fee68549a12')

package() {
  install -Dm755 grlx "$pkgdir/usr/bin/grlx"
}

