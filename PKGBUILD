# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simona-prompt-powerline-zsh
pkgver=0.0.1
pkgrel=1
pkgdesc="Custom zsh prompt (like powerline but more minimal style)"
arch=('any')
license=('GPL3')
depends=('zsh')

source=("simona-prompt-powerline-zsh-zshrc")
md5sums=('f52c6856fa89973162a724d3f6107034')

package() {
  cd "$srcdir"
  install -Dm644 "$srcdir/simona-prompt-powerline-zsh-zshrc" "$HOME/.simona-prompt-powerline-zsh-zshrc"
}












