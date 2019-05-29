# Maintainer: Sascha Wunderlich <archlinux at saschawunderlich dot de>
pkgname=profeat-bin
pkgver=1.0.0.0
pkgrel=1
pkgdesc="Feature-oriented Engineering for Probabilistic Systems"
arch=(x86_64)
url="https://wwwtcs.inf.tu-dresden.de/ALGI/PUB/ProFeat/"
license=('custom')
groups=()
conflicts=()
provides=()
depends=(gmp)
makedepends=()
source=("https://wwwtcs.inf.tu-dresden.de/ALGI/PUB/ProFeat/files/profeat-linux-$pkgver.tar.gz")
md5sums=('940694d60b89b8a87138b2926a8a18ad')


package() {
  cd "$srcdir"

  install -Dm755 profeat "$pkgdir/usr/bin/profeat"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/profeat/LICENSE"
}
