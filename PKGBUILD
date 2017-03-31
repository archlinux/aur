# Maintainer: Bryan Gilbert <gilbertw1 at gmail dot com>
pkgname=roficlip
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple shell script that surfaces clipboard history from clipster in Rofi"
arch=('i686' 'x86_64')
url="https://github.com/gilbertw1/roficlip"
license=('GPL')
depends=('clipster' 'gawk')
source=("https://github.com/gilbertw1/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('635f3369e5229fada36ce6695cf828c2c001b354ceb80112535da2aad464ebb6')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "roficlip" "$pkgdir/usr/bin/roficlip"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/roficlip/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/roficlip/LICENSE"
}
