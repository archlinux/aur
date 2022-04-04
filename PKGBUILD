pkgname=kabmat
pkgver=2.7.0
pkgrel=1
pkgdesc='TUI program for managing kanban boards with vim-like keybindings'
arch=('x86_64')
url="https://github.com/PlankCipher/kabmat"
makedepends=("make" "gcc" "ncurses")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8f0cb6ea5057e3dad7d16944802de844ee96dcd102bb784316656718a4285cfb')

package() {
  cd "kabmat-$pkgver"
  make
  install -Dm755 kabmat "${pkgdir}/usr/bin/kabmat"
}
