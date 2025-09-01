pkgname=maxfan-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Precompiled ThinkPad fan control wrapper"
arch=('x86_64')
url="https://github.com/NotiLo-A/MaxFan"
license=('GPL3')
depends=()
source=("https://github.com/NotiLo-A/MaxFan/releases/download/v$pkgver/maxfan-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  tar -xzf "maxfan-linux-x86_64.tar.gz"
  install -Dm755 maxfan "$pkgdir/usr/bin/maxfan"
}

