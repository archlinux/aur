# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=fawkes-bin
pkgver=1.0
pkgrel=3
pkgdesc="Image cloaking tool for personal privacy"
arch=('x86_64')
url="https://sandlab.cs.uchicago.edu/fawkes/"
license=('BSD')
depends=('zlib')
provides=("fawkes=$pkgver")
conflicts=('fawkes')
source=("LICENSE::https://raw.githubusercontent.com/Shawn-Shan/fawkes/master/LICENSE")
source_x86_64=("https://mirror.cs.uchicago.edu/fawkes/files/$pkgver/fawkes_binary_linux-v$pkgver.zip")
sha256sums=('SKIP')
sha256sums_x86_64=('ff74e9fa671b0d3e0fe2a749d2aed9a5cb86298a2546915b5a199669fc5e88b7')


package() {
  cd "$srcdir"

  install -Dm755 "protection" "$pkgdir/usr/bin/fawkes"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/fawkes"
}
