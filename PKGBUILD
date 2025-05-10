# Maintainer: dringsim <dringsim@qq.com>

pkgname=ttf-constructium
pkgver=20250320
pkgrel=1
pkgdesc="Fork of SIL Gentium designed specifically to support constructed scripts as encoded in the Under-ConScript Unicode Registry"
url="https://www.kreativekorp.com/software/fonts/constructium.shtml"
arch=('any')
license=('OFL')
source=("https://www.kreativekorp.com/swdownload/fonts/core/constructium.zip")
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
  install -Dm644 Constructium.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('2ffa30cae61bac79a03827a12e48db8f88691f2c0655f1ef376b8ec9cdf788c2')
