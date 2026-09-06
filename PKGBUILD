# Maintainer: Pavel Khromov <pakhromov@gmail.com>
pkgname=yzf
pkgver=1.0.0
pkgrel=1
pkgdesc="Interactive fzf front-end for yay that preserves yay's original formatting"
arch=('any')
url="https://github.com/pakhromov/yzf"
license=('MIT')
depends=('bash' 'yay' 'fzf' 'expac' 'gawk' 'pacman-contrib' 'ncurses')
optdepends=('xdg-utils: open package upstream URLs in a browser')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b26348fa7ca0ebfd7e775f8eb5199a1b639f89dc0ffb0ad625410f0a59a9d146')

package() {
      cd "$pkgname-$pkgver"
      install -Dm755 yzf "$pkgdir/usr/bin/yzf"
      install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
      install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
