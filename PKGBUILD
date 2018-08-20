# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=zsh-pure-prompt
pkgver=1.8.0
pkgrel=1
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
license=('MIT')
depends=('git' 'zsh')
source=("https://github.com/sindresorhus/pure/archive/v${pkgver}.tar.gz")
sha256sums=('28fef3c1a37c2afc6b67a31f98b861f581810a777cc8135ae56c523a9b4e7e3f')

package() {
  cd "${srcdir}/pure-${pkgver}"
  install -Dm644 pure.zsh "${pkgdir}/usr/share/zsh/functions/Prompts/prompt_pure_setup"
  install -Dm644 async.zsh "${pkgdir}/usr/share/zsh/functions/Prompts/async"
  install -Dm644 license "${pkgdir}/usr/share/licenses/zsh-pure-prompt/license"
}
