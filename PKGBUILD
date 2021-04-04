# Maintainer: Jeffrey Tse <jeffreytse.mail@gmail.com>
# Maintainer: MonstrousOgre <monstrousogre0813@gmail.com>

pkgname=zsh-vi-mode
pkgver=0.8.2
pkgrel=1
pkgdesc="A better and friendly vi(vim) mode plugin for ZSH"
arch=('any')
url="https://github.com/jeffreytse/zsh-vi-mode"
license=('MIT')
depends=('zsh')
source=("https://github.com/jeffreytse/zsh-vi-mode/archive/v$pkgver.tar.gz")
sha256sums=('888d68b451fc3221c2ee1648dbfbff38e524048b2c78620a244650fc76946c28')

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  install -Dm644 zsh-vi-mode.plugin.zsh "${pkgdir}/usr/share/zsh/plugins/$pkgname/zsh-vi-mode.plugin.zsh"
  install -Dm644 zsh-vi-mode.zsh "${pkgdir}/usr/share/zsh/plugins/$pkgname/zsh-vi-mode.zsh"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
