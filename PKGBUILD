# Maintainer: levinion <levinnion@gmail.com>
pkgname=pactime
pkgver=0.1.1
pkgrel=2
pkgdesc="List pacman packages by install time "
url="https://gist.github.com/levinion/5f6630a8b6036929d5690f9e3c6fc1b9"
arch=("any")
license=("MIT")
depends=("python" "ripgrep")
provides=("pactime")
source=(
  "https://gist.githubusercontent.com/levinion/5f6630a8b6036929d5690f9e3c6fc1b9/raw/pactime"
)
sha256sums=('SKIP')

pkgver() {
  python pactime --version
}

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
