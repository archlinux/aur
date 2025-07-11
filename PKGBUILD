# Maintainer: Mahmoud Almezali <mzmcsmzm@gmail.com>
pkgname=mtsp
pkgver=0.3.8
pkgrel=1
pkgdesc="MTSP (Music Terminal Shell Player) - a terminal-based music player with streaming and playlist support"
arch=('any')
url="https://github.com/almezali/mtsp-0.3.8"
license=('GPL3')
depends=('mpv' 'socat' 'jq' 'youtube-dl' 'fzf' 'curl')
makedepends=('git')
source=("git+$url.git#branch=main")
md5sums=('SKIP')

pkgver() {
  echo "$pkgver"
}

package() {
  cd "$srcdir/mtsp-0.3.8"

  install -Dm755 mt-music-player.sh "$pkgdir/usr/bin/mtsp"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

