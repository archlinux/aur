# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=zsh-pure-prompt
pkgver=1.28.4
pkgrel=1
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
license=('MIT')
depends=('zsh')
source=("https://github.com/sindresorhus/pure/archive/v${pkgver}.tar.gz")
b2sums=('e9e3192d6e0c5968bd563fe9d3f0b5e2989b1b5226dccd3f304b7904ca99a50f5bb7508ce9abdb622ab7b04af1e5a7be318b9ab37f7cf99b3888abd3bb76e3d7')

package() {
    cd pure-"${pkgver}"

    install -Dm644 async.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/async
    install -Dm644 pure.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/prompt_pure_setup

    install -Dm644 license "${pkgdir}"/usr/share/licenses/zsh-pure-prompt/license
}
