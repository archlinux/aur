# Maintainer: Bryan Gilbert <gilbertw1 at gmail dot com>
pkgname=roficlip
pkgver=0.1.3
pkgrel=2
pkgdesc="A simple shell script that surfaces clipboard history from clipster in Rofi"
arch=('i686' 'x86_64')
url="https://github.com/gilbertw1/roficlip"
license=('GPL')
depends=('clipster' 'gawk' 'rofi' 'fzf')
source=("https://github.com/gilbertw1/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('3ecebd3870e23b9ae977c8db1b80028fb969ea67006616cdcc61ef5c148d1003')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "roficlip" "$pkgdir/usr/bin/roficlip"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/roficlip/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/doc/roficlip/LICENSE"
}
