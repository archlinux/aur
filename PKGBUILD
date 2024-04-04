# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname='zsh-pure-prompt'
pkgver='1.23.0'
pkgrel='1'
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
license=('MIT')
depends=('zsh')
source=("https://github.com/sindresorhus/pure/archive/v${pkgver}.tar.gz")
sha256sums=('b316fe5aa25be2c2ef895dcad150248a43e12c4ac1476500e1539e2d67877921')

package() {
    cd "pure-${pkgver}"

    install -Dm644 pure.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/prompt_pure_setup
    install -Dm644 async.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/async
    install -Dm644 license "${pkgdir}"/usr/share/licenses/zsh-pure-prompt/license
}
