# Maintainer: etaquet 0xySan <etaquet@gmail.com>

pkgname="42fecth-git"
pkgver=1.0.0
pkgrel=1
pkgdesc="42fetch is a neofetch-like tool for fetching system information and displaying it in a visually appealing way and making it highly customizable. Usable for 42Students it is written Shell."
arch=('any')
url="https://github.com/0xySan/42fetch"
license=('GPL3')
depends=()
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  ./install.sh --bin-dir '/bin' --sudo --curl
  cp -r data ~/.config
  cp -r logo ~/.config
}
