# Maintainer: Jeffrey Tse <jeffreytse.mail@gmail.com>
# Maintainer: MonstrousOgre <monstrousogre0813@gmail.com>

pkgname=zsh-vi-mode
pkgver=0.8.5
pkgrel=1
pkgdesc="A better and friendly vi(vim) mode plugin for ZSH"
arch=('any')
url="https://github.com/jeffreytse/zsh-vi-mode"
license=('MIT')
depends=('zsh')
source=("https://github.com/jeffreytse/zsh-vi-mode/archive/v$pkgver.tar.gz")
sha256sums=('98ae59b83ee1886929d5c2af5e5b8a2512828cc312815bdfb34db74f2dc0476a')

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  install -Dm644 zsh-vi-mode.plugin.zsh "${pkgdir}/usr/share/zsh/plugins/$pkgname/zsh-vi-mode.plugin.zsh"
  install -Dm644 zsh-vi-mode.zsh "${pkgdir}/usr/share/zsh/plugins/$pkgname/zsh-vi-mode.zsh"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
