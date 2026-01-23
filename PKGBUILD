pkgname=minesweeper
pkgver=1.0
pkgrel=1
pkgdesc="A simple Minesweeper game"
arch=('x86_64')
url="https://github.com/yu34567890/minesweeper-c" 
license=('MIT')  
depends=('gcc')  
source=('https://raw.githubusercontent.com/yu34567890/minesweeper-c/main/main.c') 
sha256sums=('3ec72b582aec806c4ac59d0132a255e6ac063b3f0f7a23434d0598009e70126e')

build() {
  gcc -o minesweeper main.c
}

package() {
  install -Dm755 minesweeper "$pkgdir/usr/bin/minesweeper"
}

clean() {
  rm -f minesweeper  
}
