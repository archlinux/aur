# Maintainer: Simona <simona.pisano.70[at]gmail[dot]com>
pkgname=my-zshrc-bashrc
pkgver=1.0.0
pkgrel=1
pkgdesc="My personal zshrc-bashrc (use for hints)"
#url="https://github.com/simona70/grub-custom-simona"
arch=('any')
license=('GPL3')

depends=('bash')
optdepends=('zsh' 'oh-my-zsh-git' 'powerline' 'zsh-theme-powerlevel10k-git')


source=($pkgname-$pkgver.tar.gz)
source=("bashrc" "zshrc" "simonarc" "simona-help-txt-rc")

md5sums=('18eb2c3b8bf5e435bc462fa96081ace6'
         '41ede81deeea13f2128b6b666693c6e8'
         'f90c756fff1c6a29073f5f1fe880dc23'
         'd18f27cb9f2734113b29eeb97b9f0c79')

package() {
  cd "$srcdir"

  install -Dm755 "$srcdir/bashrc" "$HOME/hints/bashrc"
  install -Dm755 "$srcdir/zshrc" "$HOME/hints/zshrc"
  install -Dm755 "$srcdir/simonarc" "$HOME/hints/simonarc"
  install -Dm755 "$srcdir/simona-help-txt-rc" "$HOME/hints/simona-help-txt-rc"
}












