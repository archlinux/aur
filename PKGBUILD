# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Stefan Tatschner <stefan.tatschner@gmail.com>

_pkgname=git-flow-completion
pkgname=gitflow-zshcompletion-avh
pkgver=0.6.0
pkgrel=1
pkgdesc="ZSH completion support for gitflow (AVH-Edition)."
arch=('any')
url='https://github.com/petervanderdoes/git-flow-completion'
license=('MIT')
depends=('zsh' 'git' 'gitflow')
source=("https://github.com/petervanderdoes/git-flow-completion/archive/${pkgver}.tar.gz")
sha512sums=('1082ad47938ec78045f4cbd12340a82960ba3de204c21a95e1166cb0b86e96dbbc3e5fc8af1945c951d5edd43b4026021761e8377795acbb87af3c1e391cb256')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  install -m 0644 "git-flow-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/"
}
