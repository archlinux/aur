# Maintainer: Gabriele Musco <gabmus@disroot.org>
# Upstream URL: https://github.com/andreaskoch/allmark

pkgname=allmark-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='Fast, standalone markdown web server'
arch=('any')
url='https://github.com/andreaskoch/allmark'
license=('custom: New BSD License')
depends=()
makedepends=()
provides=('allmark')
conflicts=('allmark' 'allmark-git')
source=(
  "allmark::https://allmark.io/bin/files/allmark_linux_amd64"
  "LICENSE::https://raw.githubusercontent.com/andreaskoch/allmark/develop/LICENSE"
)
sha256sums=(
  'e21313f89ec6773787ebaff54d55c380c3484cc523fa53a502cff7bbb8e83171'
  'bb45a00c4b29a24712c5e081b7d75fb58ef1ecf5adbbdd40ed81f93fed252b81'
)

package() {
  install -D -m755 "$srcdir/allmark" "$pkgdir/usr/bin/allmark"
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/allmark/LICENSE"
}
