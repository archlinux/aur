# Maintainer: danieledema
pkgname=zettli
pkgver=1.0.1
pkgrel=1
pkgdesc="A fuzzy CLI note manager with fzf + bat + ripgrep"
arch=('any')
url="https://github.com/danieledema/zettli"
license=('GPL3')
depends=('fzf' 'ripgrep' 'bat')
makedepends=('git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 zettli.sh "$pkgdir/usr/bin/zettli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
