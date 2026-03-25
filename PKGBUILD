pkgname=linux-tool-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="AUR and Pacman package manager helper with Slint UI"
arch=('x86_64')
url="https://github.com/Enzo415611/linux-tool"
license=('MIT')
depends=('glibc')

source=("https://github.com/Enzo415611/linux-tool/releases/download/v$pkgver/linux-tool")
sha256sums=('SKIP')

package() {
  install -Dm755 linux-tool "$pkgdir/usr/bin/linux-tool"
}
