# Maintainer: hackia <hackia at eytukan dot com>

pkgname=woman
pkgver=0.0.1
pkgrel=2
pkgdesc="Rust Live Dev Environment with screen|tmux and web monitoring via ttyd"
arch=('any')
url="https://github.com/hackia/woman"
license=('GPL')
depends=('ttyd' 'rustup' 'cargo' 'cargo-watch' 'cargo-audit' 'cargo-deny' 'cargo-hack' 'cargo-udeps' 'screen' 'tmux')
optdepends=('code' 'fish' 'zsh' 'lazygit')
provides=('woman')
source=("https://github.com/hackia/woman/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('490bd41d9a5809eae63ac4fcd2f27dd44bd568bca500aec208df219bb304fde3d00d4fe8fd0c6fc79dc58e1e70f6e5b51480271ad43a2fb6ef2902f7243b3b57')

package() {
  cd "$pkgname-$pkgver"
  sudo make install
}

