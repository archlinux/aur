pkgname=rolldice-gorou
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI music player with true shuffle (roll the dice)"
arch=("any")
url="https://example.com/rolldice"
license=("MIT")
depends=("python" "mpv")
source=("rolldice.py")
sha256sums=("SKIP")

package() {
  install -Dm755 rolldice.py "$pkgdir/usr/bin/rolldice"
}

