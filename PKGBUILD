# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=nix-zsh-completions
pkgver=0.5.1
pkgrel=1
arch=(any)
license=(BSD)
provides=("$pkgname")
conflicts=("$pkgname")
depends=(zsh nix)
pkgdesc="ZSH Completions for Nix"
url="https://github.com/nix-community/nix-zsh-completions"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0af414ff8eb98da5e7db45fbd3c43325911ba6c570c4b1f3636b042d4df09b1e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions" _*
}
