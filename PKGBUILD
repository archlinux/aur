# Maintainer: Pavel Khromov <pakhromov@gmail.com>
pkgname=yzf
pkgver=1.0.1
pkgrel=1
pkgdesc="Interactive fzf front-end for yay that preserves yay's original formatting"
arch=('any')
url="https://github.com/pakhromov/yzf"
license=('MIT')
depends=('bash' 'yay' 'fzf' 'expac' 'gawk' 'pacman-contrib' 'ncurses')
optdepends=('xdg-utils: open package upstream URLs in a browser')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29af0a9b6b6592bb7ae103b7750fed09e42f26985d71931baf2b55056bb22360')

package() {
      cd "$pkgname-$pkgver"
      install -Dm755 yzf "$pkgdir/usr/bin/yzf"
      install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
      install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
