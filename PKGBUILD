# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Daniel Greve <greve.daniel.l@gmail.com>

pkgname='zsh-pure-prompt'
pkgver=1.25.0
pkgrel=1
pkgdesc='Pretty, minimal and fast ZSH prompt'
arch=('any')
url='https://github.com/sindresorhus/pure'
license=('MIT')
depends=('zsh')
source=("https://github.com/sindresorhus/pure/archive/v${pkgver}.tar.gz")
sha256sums=('bbe94ab451d893e9610249ccde57a7ff1f03194045223073f4c044afea83b7d4')

package() {
    cd pure-"${pkgver}"

    install -Dm644 pure.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/prompt_pure_setup
    install -Dm644 async.zsh "${pkgdir}"/usr/share/zsh/functions/Prompts/async
    install -Dm644 license "${pkgdir}"/usr/share/licenses/zsh-pure-prompt/license
}
