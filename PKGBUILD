pkgname=minesweeper
pkgver=1.0
pkgrel=1
pkgdesc="A simple Minesweeper game"
arch=('x86_64')
url="https://github.com/yu34567890/minesweeper-c" 
license=('MIT')  
depends=('gcc')  
source=('https://raw.githubusercontent.com/yu34567890/minesweeper-c/main/main.c') 
sha256sums=('d4b2ea7d5f9044dc3825d48a670b9cb37becc284b67757e87855eca50d016e20')

build() {
  gcc -o minesweeper main.c
}

package() {
  install -Dm755 minesweeper "$pkgdir/usr/bin/minesweeper"
}

clean() {
  rm -f minesweeper  
}
