# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=zsh-pure-prompt
pkgver=1.19.0
pkgrel=1
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
_github_url='https://github.com/sindresorhus/pure'
license=('MIT')
depends=('git' 'zsh')
source=("https://github.com/sindresorhus/pure/archive/v${pkgver}.tar.gz")
sha256sums=('fc5f21e3b2662ef26e7854ca0a88968b1f2911fae19b8efec75e9ea7877ea96b')

package() {
  cd "${srcdir}/pure-${pkgver}"
  install -Dm644 pure.zsh "${pkgdir}/usr/share/zsh/functions/Prompts/prompt_pure_setup"
  install -Dm644 async.zsh "${pkgdir}/usr/share/zsh/functions/Prompts/async"
  install -Dm644 license "${pkgdir}/usr/share/licenses/zsh-pure-prompt/license"
}
