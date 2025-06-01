pkgname=vimgo-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A TUI file manager written in Go, ntegrated with NVIM"
arch=('x86_64')
url="https://github.com/ethical-buddy/Vimgo"
license=('MIT')
depends=()
source=("https://github.com/ethical-buddy/Vimgo/releases/download/v${pkgver}/vimgo")
sha256sums=('SKIP') # Replace SKIP with the actual checksum if you want

package() {
  install -Dm755 "$srcdir/vimgo" "$pkgdir/usr/local/bin/vimgo"
}
