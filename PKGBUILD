# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=zsh-pure-prompt
pkgver=1.6.0
pkgrel=1
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
license=('MIT')
depends=('git>=2.0.0' 'zsh>=5.0.0')
source=("https://github.com/sindresorhus/pure/archive/v${pkgver}.tar.gz")
sha256sums=('e913856cab98c17fa627e8135fc23dae9cefdddd6aef5cd60dd998c703a80f76')

package() {
  cd "${srcdir}/pure-${pkgver}"
  install -Dm644 pure.zsh "${pkgdir}/usr/share/zsh/functions/Prompts/prompt_pure_setup"
  install -Dm644 async.zsh "${pkgdir}/usr/share/zsh/functions/Prompts/async"
  install -Dm644 license "${pkgdir}/usr/share/licenses/zsh-pure-prompt/license"
}
