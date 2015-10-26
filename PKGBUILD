# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Stefan Tatschner <stefan.tatschner@gmail.com>

_pkgname=git-flow-completion
pkgname=gitflow-zshcompletion-avh
pkgver=0.5.2
pkgrel=1
pkgdesc="ZSH completion support for gitflow (AVH-Edition)."
arch=('any')
url='https://github.com/petervanderdoes/git-flow-completion'
license=('MIT')
depends=('zsh' 'git' 'gitflow')
conflicts=('zsh-completions')
source=("https://github.com/petervanderdoes/git-flow-completion/archive/${pkgver}.tar.gz")
sha512sums=('500cb6163ebb2bf9b996dd5bcac00efa857badfc95ee1d633f2b16803c6baae7315a96c713107645e0971be4736fe1eef747dc773eb50da138551be4838c21b3')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  install -m 0644 "git-flow-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/"
}
