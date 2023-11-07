# Maintainer: Jeffrey Tse <jeffreytse.mail@gmail.com>
# Maintainer: MonstrousOgre <monstrousogre0813@gmail.com>

pkgname=zsh-vi-mode
pkgver=0.11.0
pkgrel=1
pkgdesc="A better and friendly vi(vim) mode plugin for ZSH"
arch=('any')
url="https://github.com/jeffreytse/zsh-vi-mode"
license=('MIT')
depends=('zsh')
source=("https://github.com/jeffreytse/zsh-vi-mode/archive/v$pkgver.tar.gz")
sha256sums=('03e1b5f0eef89afa834416bd2751584093b929506e11867fbabf9a7f9e57452a')

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  install -Dm644 zsh-vi-mode.plugin.zsh "${pkgdir}/usr/share/zsh/plugins/$pkgname/zsh-vi-mode.plugin.zsh"
  install -Dm644 zsh-vi-mode.zsh "${pkgdir}/usr/share/zsh/plugins/$pkgname/zsh-vi-mode.zsh"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
