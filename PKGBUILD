# Maintainer: Jeffrey Tse <jeffreytse.mail@gmail.com>
# Maintainer: MonstrousOgre <monstrousogre0813@gmail.com>

pkgname=zsh-vi-mode
pkgver=0.8.4
pkgrel=1
pkgdesc="A better and friendly vi(vim) mode plugin for ZSH"
arch=('any')
url="https://github.com/jeffreytse/zsh-vi-mode"
license=('MIT')
depends=('zsh')
source=("https://github.com/jeffreytse/zsh-vi-mode/archive/v$pkgver.tar.gz")
sha256sums=('d16814693099dcc6f47afe3e5575af539a7aee1071f3f532c233800918722398')

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  install -Dm644 zsh-vi-mode.plugin.zsh "${pkgdir}/usr/share/zsh/plugins/$pkgname/zsh-vi-mode.plugin.zsh"
  install -Dm644 zsh-vi-mode.zsh "${pkgdir}/usr/share/zsh/plugins/$pkgname/zsh-vi-mode.zsh"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
