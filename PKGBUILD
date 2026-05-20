# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=zsh-pure-prompt
pkgver=1.28.1
pkgrel=1
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
license=('MIT')
depends=('zsh')
source=("https://github.com/sindresorhus/pure/archive/v${pkgver}.tar.gz")
b2sums=('bbfb13ddb133adf5d4bcd84dc6963a804165bd42e4a1de4dbf9e42196c53adf52d34b8398b87cfba37370057a5b02f63429d09a1c9a8acfe68b044bd6716f803')

package() {
    cd pure-"${pkgver}"

    install -Dm644 async.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/async
    install -Dm644 pure.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/prompt_pure_setup

    install -Dm644 license "${pkgdir}"/usr/share/licenses/zsh-pure-prompt/license
}
