# Maintainer: Bryan Gilbert <gilbertw1 at gmail dot com>
pkgname=roficlip
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple shell script that surfaces clipboard history from clipster in Rofi"
arch=('i686' 'x86_64')
url="https://github.com/gilbertw1/roficlip"
license=('GPL')
depends=('clipster' 'gawk' 'rofi')
source=("https://github.com/gilbertw1/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f72d81fddfe8823340d18d83ce2ca6f4492f024cbfa6dabb7961c38d69062ffd')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "roficlip" "$pkgdir/usr/bin/roficlip"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/roficlip/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/roficlip/LICENSE"
}
