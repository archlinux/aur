# Maintainer: Dringsim <dringsim@qq.com>

pkgname=ttf-constructium
pkgver=20230729
pkgrel=1
pkgdesc="Fork of SIL Gentium designed specifically to support constructed scripts as encoded in the Under-ConScript Unicode Registry"
url="https://www.kreativekorp.com/software/fonts/constructium.shtml"
arch=('any')
license=('OFL')
source=("https://www.kreativekorp.com/swdownload/fonts/core/constructium.zip")
sha256sums=('87E6F79CA9879C78CBB8BA97FB74DC8398226DCAE757D55128C39C3E2D9D303B')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
  install -Dm644 Constructium.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

