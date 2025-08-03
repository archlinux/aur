# Maintainer: Mahmoud Almezali <mzmcsmzm@gmail.com>
pkgname=mtsp3
pkgver=3.0.1
pkgrel=3
pkgdesc="MTSP3 (Music Terminal Shell Player) - a pro terminal-based music player with streaming and playlist support and more"
arch=('any')
url="https://github.com/almezali/mtsp-v3.0.1"
license=('GPL3')
depends=('mpv' 'socat' 'dialog' 'sqlite3' 'ffmpeg' 'jq' 'youtube-dl' 'fzf' 'curl')
makedepends=('git')
source=("git+$url.git#branch=main")
md5sums=('SKIP')

pkgver() {
  echo "$pkgver"
}

package() {
  cd "$srcdir/mtsp-v3.0.1"

  install -Dm755 mtsp-v3.0.1.sh "$pkgdir/usr/bin/mtsp3"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

