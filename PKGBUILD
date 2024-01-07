# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=nix-zsh-completions
pkgver=0.5.0
pkgrel=1
arch=(any)
license=(BSD)
provides=("$pkgname")
conflicts=("$pkgname")
depends=(zsh nix)
pkgdesc="ZSH Completions for Nix"
url="https://github.com/nix-community/nix-zsh-completions"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('34981443f61b6383079b63b9a89af4eec03c9fa67789dc0180d28c916e494523')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions" _*
}
