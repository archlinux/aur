# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Stefan Tatschner <stefan.tatschner@gmail.com>

_pkgname=git-flow-completion
pkgname=gitflow-zshcompletion-avh
pkgver=0.5.1
pkgrel=1
pkgdesc="ZSH completion support for gitflow (AVH-Edition)."
arch=('any')
url='https://github.com/petervanderdoes/git-flow-completion'
license=('MIT')
depends=('zsh' 'git' 'gitflow')
conflicts=('zsh-completions')
source=("https://github.com/petervanderdoes/git-flow-completion/archive/${pkgver}.tar.gz")
md5sums=('e4cc40aaf00a0e99e4e4b927c0dd49ee')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  install -m 0644 "git-flow-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/"
}
