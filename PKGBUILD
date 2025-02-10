# Maintainer: dringsim <dringsim@qq.com>

pkgname=ttf-constructium
pkgver=20240601
pkgrel=1
pkgdesc="Fork of SIL Gentium designed specifically to support constructed scripts as encoded in the Under-ConScript Unicode Registry"
url="https://www.kreativekorp.com/software/fonts/constructium.shtml"
arch=('any')
license=('OFL')
source=("https://www.kreativekorp.com/swdownload/fonts/core/constructium.zip")
sha256sums=('85cf9d728b143169ddf4f9c00a53025dce533a748646d1d7afbe24c18d6dbe2e')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

package() {
  install -Dm644 Constructium.ttf  -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

