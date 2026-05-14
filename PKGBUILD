# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=zsh-pure-prompt
pkgver=1.28.0
pkgrel=1
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
license=('MIT')
depends=('zsh')
source=("https://github.com/sindresorhus/pure/archive/v${pkgver}.tar.gz")
b2sums=('6ccfd79b701190183c9258905276ee8776906f53e3732cbae272e2aeeed5afe42e2d6d46d9b5038123e6c5112fc05610d5a7b079167d369e47c307abec3f1e18')

package() {
    cd pure-"${pkgver}"

    install -Dm644 async.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/async
    install -Dm644 pure.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/prompt_pure_setup

    install -Dm644 license "${pkgdir}"/usr/share/licenses/zsh-pure-prompt/license
}
