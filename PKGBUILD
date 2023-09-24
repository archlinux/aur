# Maintainer: Jeffrey Tse <jeffreytse.mail@gmail.com>
# Maintainer: MonstrousOgre <monstrousogre0813@gmail.com>

pkgname=zsh-vi-mode
pkgver=0.10.0
pkgrel=1
pkgdesc="A better and friendly vi(vim) mode plugin for ZSH"
arch=('any')
url="https://github.com/jeffreytse/zsh-vi-mode"
license=('MIT')
depends=('zsh')
source=("https://github.com/jeffreytse/zsh-vi-mode/archive/v$pkgver.tar.gz")
sha256sums=('fbb8f9d96cff3ff874b4ef8e5fcda10045bd75c28fc2c4edb480fca6b8c39e71')

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  install -Dm644 zsh-vi-mode.plugin.zsh "${pkgdir}/usr/share/zsh/plugins/$pkgname/zsh-vi-mode.plugin.zsh"
  install -Dm644 zsh-vi-mode.zsh "${pkgdir}/usr/share/zsh/plugins/$pkgname/zsh-vi-mode.zsh"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
